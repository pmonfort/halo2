import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";

const RoboscoutQueryListPeopleIndex = () => {
  const { id } = useParams();

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

  /**
   * TODO: Add the code below that will allow Liking or Unliking a candidate.
   */

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
            return (
              <tr>
                <td>{person.id}</td>
                <td>{person.first_name}</td>
                <td>{person.last_name}</td>
                <td>{person.publication_count}</td>
                <td>{person.relevance_score}</td>
                <td>
                  <button>Like</button>
                </td>
              </tr>
            );
          })}
          <tr>
            <td>
              <button>Like</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default RoboscoutQueryListPeopleIndex;
