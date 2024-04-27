import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import RoboscoutQueryListIndex from "./RoboscoutQueryListIndex";
import RoboscoutQueryListPeopleIndex from "./RoboscoutQueryListPeopleIndex";

const App = () => {
  const queryClient = new QueryClient();

  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <div className="container">
          <header>
            <p>Roboscout</p>
          </header>
          <div className="container">
            <Routes>
              <Route path="/" element={<RoboscoutQueryListIndex />} />
              <Route
                path="/:id/results"
                element={<RoboscoutQueryListPeopleIndex />}
              />
            </Routes>
          </div>
        </div>
      </BrowserRouter>
    </QueryClientProvider>
  );
};

export default App;
