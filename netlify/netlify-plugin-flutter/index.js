const flutterPath = process.env['HOME'] + '/flutter'
const flutterBinPath = flutterPath + '/bin'

/* eslint-disable no-unused-vars */
export const onPreBuild = async function ({
    inputs,
    // Core utilities
    utils: {
      // Utility to report errors.
      // See https://github.com/netlify/build#error-reporting
      build,
      // Utility to display information in the deploy summary.
      // See https://github.com/netlify/build#logging
      status,
      // Utility for caching files.
      // See https://github.com/netlify/build/blob/master/packages/cache-utils#readme
      cache,
      // Utility for running commands.
      // See https://github.com/netlify/build/blob/master/packages/run-utils#readme
      run,
    },
  }) {
  try {
    const targetChannel = inputs.channel || 'stable'

    console.log('⚡️ Downloading Flutter SDK')
    await run('git', [
      'clone',
      'https://github.com/flutter/flutter.git',
      '--depth',
      1,
      '-b',
      targetChannel,
      flutterPath,
    ])
    console.log('✅ Flutter SDK downloaded')

    // https://github.com/canonical/snapcraft/pull/5264
    // Fixed in 3.29.1
    // console.log('🐛 Removing engine/src/.gn')
    // await run('rm', [
    //   '-f',
    //   flutterPath + '/engine/src/.gn',
    // ])

    console.log('🪄 Adding Flutter to PATH')
    process.env['PATH'] = process.env['PATH'] + ':' + flutterBinPath

    console.log('🔨 Running flutter doctor')
    await run('flutter', ['doctor'])

    status.show({summary: 'Flutter SDK installed'})
  } catch (error) {
    build.failBuild("Flutter SDK installation failed", { error });
  }
}
