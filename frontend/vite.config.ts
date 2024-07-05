import react from '@vitejs/plugin-react-swc';
import vike from 'vike/plugin';
import { defineConfig, loadEnv } from 'vite';
import tsconfigPaths from 'vite-tsconfig-paths';

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
  return {
    plugins: [react(), tsconfigPaths(), vike()],
    define: {
      'process.env': loadEnv(mode, process.cwd(), ''),
    },
    server: {
      port: 8080,
      proxy: {
        '/api': {
          target: `http://0.0.0.0:8081`,
          changeOrigin: true,
          rewrite: (path) => path.replace(/^\/api/, ''),
        },
      },
    },
  };
});
