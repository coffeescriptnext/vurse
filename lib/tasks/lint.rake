begin
  require 'rake/tasklib'
  require 'inch/rake'
  require 'jshintrb/jshinttask'
  require 'rubocop/rake_task'

  namespace :lint do
    desc 'Lint JavaScript files'
    Jshintrb::JshintTask.new(:javascripts) do |t|
      t.pattern = '{app/assets,spec}/javascripts/**/*.js'
      t.options = {
        bitwise:  true,
        browser:  true,
        curly:    true,
        eqeqeq:   true,
        forin:    true,
        immed:    true,
        latedef:  true,
        newcap:   true,
        noarg:    true,
        noempty:  true,
        nonew:    true,
        plusplus: true,
        regexp:   true,
        strict:   true,
        trailing: true,
        undef:    true,

        predef: {
          '$'        => true,
          'ace'      => true,
          'chai'     => true,
          'describe' => true,
          'expect'   => true,
          'it'       => true
        }
      }
    end

    desc 'Lint Ruby files'
    RuboCop::RakeTask.new(:ruby)

    desc 'Lint SCSS files'
    task :stylesheets do
      require 'scss_lint'
      require 'scss_lint/cli'

      result = SCSSLint::CLI.new.run(%w(app/assets))

      next if result == SCSSLint::CLI::EXIT_CODES[:ok]

      message =
        case result
        when SCSSLint::CLI::EXIT_CODES[:error], SCSSLint::CLI::EXIT_CODES[:warning]
          'scss-lint found one or more lints'
        else
          'scss-lint failed with an error'
        end

      $stderr.puts message
      exit result
    end

    desc 'Lint inline documentation'
    Inch::Rake::Suggest.new(:docs)
  end

  desc 'Run all linters'
  task lint: %w(lint:docs lint:ruby lint:javascripts lint:stylesheets)
rescue LoadError # rubocop:disable HandleExceptions
end
