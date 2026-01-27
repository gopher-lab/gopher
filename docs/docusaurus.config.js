// @ts-check
// Docusaurus configuration for Gopher documentation

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Gopher Documentation',
  tagline: 'AI-Powered Trading Strategy Discovery',
  favicon: 'img/favicon.ico',

  // GitHub Pages URL
  url: 'https://gopher-lab.github.io',
  baseUrl: '/gopher/',

  organizationName: 'gopher-lab',
  projectName: 'gopher',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: './sidebars.js',
          routeBasePath: '/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Gopher',
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'docsSidebar',
            position: 'left',
            label: 'Documentation',
          },
          {
            href: 'https://github.com/gopher-lab/gopher/releases',
            label: 'Download',
            position: 'right',
          },
          {
            href: 'https://github.com/gopher-lab/gopher',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Documentation',
            items: [
              {
                label: 'Getting Started',
                to: '/guides/quickstart',
              },
              {
                label: 'Configuration',
                to: '/guides/configuration',
              },
            ],
          },
          {
            title: 'Download',
            items: [
              {
                label: 'macOS',
                to: '/installation/macos',
              },
              {
                label: 'Windows',
                to: '/installation/windows',
              },
              {
                label: 'CLI',
                to: '/installation/cli',
              },
            ],
          },
          {
            title: 'Support',
            items: [
              {
                label: 'GitHub Issues',
                href: 'https://github.com/gopher-lab/gopher/issues',
              },
              {
                label: 'Contact',
                href: 'mailto:hello@gopher-ai.com',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Gopher AI. All rights reserved.`,
      },
      prism: {
        theme: require('prism-react-renderer').themes.github,
        darkTheme: require('prism-react-renderer').themes.dracula,
        additionalLanguages: ['bash', 'yaml', 'json'],
      },
    }),
};

module.exports = config;
