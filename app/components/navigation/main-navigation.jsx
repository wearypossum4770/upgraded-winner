import { Link } from "@remix-run/react";

const menuItems = [
  { to: "/notes", label: "Notes" },
  { to: "/posts", label: "blog post" },
  { to: "/join", label: "Sign up" },
  { to: "/login", label: "log in" },
  { to: "/jokes", label: "Jokes" },
  { to: '/features', label: "Feature Flags"},
  { to: "/healthcheck", label: "Health Check"},
  { to:  "/features", label: 'Features'},
].map((link, id) => ({ ...link, id: id + 1 }));

const  MainNavigation = () => (
      <aside className="main-navigation-header">
        <nav className="main-navigation-container">
          <ul className="main-navigation-links">
            {menuItems.map((nav) => (
              <li key={nav.id} className="main-navigation-link-item">
                <Link to={nav.to}>{nav.label}</Link>
              </li>
            ))}
          </ul>
        </nav>
      </aside>
    );

  

export default MainNavigation