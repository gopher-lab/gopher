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
        {
          type: 'category',
          label: 'CLI',
          items: [
            'installation/cli/overview',
            'installation/cli/setup',
            'installation/cli/backtest',
            'installation/cli/montecarlo',
            'installation/cli/evolve',
            'installation/cli/live',
            'installation/cli/trades',
            'installation/cli/history',
            'installation/cli/coverage',
            'installation/cli/assets',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: 'User Guide',
      items: [
        'guides/quickstart',
        'guides/configuration',
        'guides/indicators',
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
