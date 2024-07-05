import { ToastContainer, Zoom } from "react-toastify";
import "./global.css";
import "react-toastify/ReactToastify.css";

const Layout = ({ children }: { children: React.ReactNode }) => {
  return (
    <div>
      <ToastContainer transition={Zoom} theme="colored" position="top-center" />
      <main>{children}</main>
    </div>
  );
};

export { Layout };
