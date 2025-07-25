import { useQuery } from "@tanstack/react-query";
import { useState } from "react";
import { useParams } from "react-router-dom";

const RoboscoutQueryListPeopleIndex = () => {
  const { id } = useParams();
  const [likedPeople, setLikedPeople] = useState<Set<number>>(new Set());

  const { data, isLoading } = useQuery({
    queryKey: ["roboscout_people_index", id],
    queryFn: async () => {
      const res = await fetch(`/roboscout_queries/${id}/people`);
      return res.json();
    },
  });

  if (isLoading) {
    return <div>Loading...</div>;
  }

  const toggleLike = (personId: number) => {
    setLikedPeople((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(personId)) {
        newSet.delete(personId);
      } else {
        newSet.add(personId);
      }
      return newSet;
    });
  };

  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Publications</th>
            <th>Relevance</th>
            <th>Liked?</th>
          </tr>
        </thead>
        <tbody>
          {data.people.map((person: any) => {
            const isLiked = likedPeople.has(person.id);
            return (
              <tr key={person.id}>
                <td>{person.id}</td>
                <td>{person.first_name}</td>
                <td>{person.last_name}</td>
                <td>{person.publication_count}</td>
                <td>{person.relevance}</td>
                <td>
                  <button onClick={() => toggleLike(person.id)}>
                    {isLiked ? "Unlike" : "Like"}
                  </button>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default RoboscoutQueryListPeopleIndex;
