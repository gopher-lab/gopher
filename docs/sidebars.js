/**
 * Sidebars for Gopher documentation
 * @type {import('@docusaurus/plugin-content-docs').SidebarsConfig}
 */
const sidebars = {
  docsSidebar: [
    'index',
    {
      type: 'category',
      label: 'Installation',
      items: [
        'installation/macos',
        'installation/windows',
        'installation/cli',
      ],
    },
    {
      type: 'category',
      label: 'User Guide',
      items: [
        'guides/quickstart',
        'guides/configuration',
        'guides/strategy-evolution',
        'guides/custom-prompts',
        'guides/troubleshooting',
        'guides/faq',
        'guides/contributing',
      ],
    },
    {
      type: 'category',
      label: 'Reference',
      items: [
        'reference/data-coverage',
        'reference/models',
      ],
    },
  ],
};

module.exports = sidebars;
