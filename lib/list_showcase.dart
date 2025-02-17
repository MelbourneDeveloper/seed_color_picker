import 'package:flutter/material.dart';

class ListShowcase extends StatelessWidget {
  const ListShowcase({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('List Examples', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                title: const Text('Primary Color Avatar'),
                subtitle: const Text('With onPrimary icon'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Divider(color: Theme.of(context).colorScheme.outlineVariant),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                title: const Text('Secondary Color Avatar'),
                subtitle: const Text('With onSecondary icon'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Divider(color: Theme.of(context).colorScheme.outlineVariant),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  child: Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                title: const Text('Tertiary Color Avatar'),
                subtitle: const Text('With onTertiary icon'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.inbox,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surface Container Highest',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'With primary color icon',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surface Background',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'With secondary color icon',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
