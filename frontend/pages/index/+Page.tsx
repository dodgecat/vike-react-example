import { useData } from "vike-react/useData";
export default function Page() {
  const data = useData<{ world: string }>();
  const World: string = data?.world ?? "World";
  return <div>{`Hello, ${World}`}!</div>;
}
