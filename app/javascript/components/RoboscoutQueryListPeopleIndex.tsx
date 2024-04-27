const RoboscoutQueryListPeopleIndex = () => {
  /**
   * TODO: useQuery to fetch real data.
   */
  const data = [
    {
      id: 1,
      first_name: "John",
      last_name: "Smith",
      publications: "10",
      relevance: 1.0,
    },
  ];

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
          </tr>
        </thead>
        <tbody>
          <tr>
            {data.map((row) => {
              return Object.values(row).map((column) => <td>{column}</td>);
            })}
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default RoboscoutQueryListPeopleIndex;
