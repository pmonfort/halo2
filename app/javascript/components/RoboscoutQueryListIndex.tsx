import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

const queryKey = "roboscout_query_list";

const RoboscoutQueryListIndex = () => {
  const navigate = useNavigate();
  const [query, setQuery] = useState("");
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: [queryKey],
    queryFn: async () => {
      const response = await fetch("/roboscout_queries");
      return response.json();
    },
  });

  const mutation = useMutation({
    mutationFn: async (payload: { query: string }) => {
      const response = await fetch("/roboscout_queries", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      return response.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: [queryKey] });
      setQuery("");
    },
    onError: (error) => {
      console.error("An error occured while creating the query.", error);
    },
  });

  if (isLoading) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <div>
        <input
          type="text"
          size={30}
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <button onClick={() => mutation.mutate({ query })}>Submit</button>
      </div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Query</th>
            <th>Progress</th>
            <th>Results</th>
          </tr>
        </thead>
        <tbody>
          {data.roboscout_queries.map((row: any) => {
            return (
              <tr
                onClick={() => navigate(`/${row.id}/results`)}
                key={`roboscout-query-${row.id}`}
              >
                {Object.values(row).map((column: any) => (
                  <td key={`roboscout-query-${row.id}-${column}`}>{column}</td>
                ))}
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default RoboscoutQueryListIndex;
