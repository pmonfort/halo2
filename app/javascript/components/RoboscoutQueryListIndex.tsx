import { useQuery } from "@tanstack/react-query";
import { useNavigate } from "react-router-dom";

const RoboscoutQueryListIndex = () => {
  const navigate = useNavigate();

  const { data, isLoading } = useQuery({
    queryKey: ["roboscout_query_list"],
    queryFn: async () => {
      const res = await fetch("/roboscout_queries");
      return res.json();
    },
  });

  if (isLoading) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Query</th>
            <th>Results</th>
            <th>Progress</th>
          </tr>
        </thead>
        <tbody>
          <tr onClick={() => navigate("/1/results")}>
            {data.roboscout_queries.map((row: any) => {
              return Object.values(row).map((column: any) => <td>{column}</td>);
            })}
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default RoboscoutQueryListIndex;
