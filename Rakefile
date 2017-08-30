#
# Copyright (c) 2017 PSPDFKit GmbH. All rights reserved.
#

# General Guidelines
# ------------------
#
# Try to avoid file and directory names containing *spaces*.
#
# On the other hand, *quote* every file and directory reference when passing
# it to a command if the reference *might* contain a space.
#
# Avoid encapsulating parts of the build script into functions. As a rule of
# thumb: no function other than `run` should call a shell command (exception:
# generic one-liners to check something for example) and no function should
# call the `run` function itself, `run` is only intended to be used at the task
# level.
#
# Keep intermediate results. If you need to modify a previous result, copy it
# first. This will ease debugging if something goes wrong and allows you to
# comment out certain stages of the script to safe time when working on it.
#
# When working within a deep-ish path, consider cd-ing into the directory first.
# You have to do this for each run call, simply prepend your actual command
# with something like `cd some/deep/directory/; ...`. Do *not* change the
# working directory for the whole script though (using Ruby's `File.chdir` &
# friends).

# Naming Conventions: Constants
# -----------------------------
#
# * A directory name is suffixed with `_DIRECTORY`
# * A file's base name constant is suffixed with `_NAME`
# * A file's full name including extension is suffixed with `_FILE`
# * A full file or directory path (absolute & relative) is suffixed with `_PATH`
# * A directory path should *not* end with a slash `/`
#
# Try to avoid full path constants because it becomes really difficult to read
# and understand the build script, i.e. what file or directory is referenced or
# created and where.

require 'rubygems'

# --------------------------------------------------------------- Options ------

NAME = ENV['name'] || ""
DIRECTORY = ENV['directory'] || "Build"
VERBOSE = ENV['verbose'] || false

# ------------------------------------------------------------- Constants ------

XCODE_FLAGS = "-configuration Release -scheme PDFXKit -derivedDataPath \"#{DIRECTORY}/Xcode\""

# ---------------------------------------------------------------- Colors ------

TERMINAL = STDOUT.tty?

BOLD = TERMINAL ? "\x1B[0;1m" : ""
RESET = TERMINAL ? "\x1B[0m" : ""

BLACK = TERMINAL ? "\x1B[0;30m" : ""; RED = TERMINAL ? "\x1B[0;31m" : ""; GREEN = TERMINAL ? "\x1B[0;32m" : ""; YELLOW = TERMINAL ? "\x1B[0;33m" : ""; BLUE = TERMINAL ? "\x1B[0;34m" : ""; MAGENTA = TERMINAL ? "\x1B[0;35m" : ""; CYAN = TERMINAL ? "\x1B[0;36m" : ""; WHITE = TERMINAL ? "\x1B[0;37m" : ""
BLACK_BRIGHT = TERMINAL ? "\x1B[1;30m" : ""; RED_BRIGHT = TERMINAL ? "\x1B[1;31m" : ""; GREEN_BRIGHT = TERMINAL ? "\x1B[1;32m" : ""; YELLOW_BRIGHT = TERMINAL ? "\x1B[1;33m" : ""; BLUE_BRIGHT = TERMINAL ? "\x1B[1;34m" : ""; MAGENTA_BRIGHT = TERMINAL ? "\x1B[1;35m" : ""; CYAN_BRIGHT = TERMINAL ? "\x1B[1;36m" : ""; WHITE_BRIGHT = TERMINAL ? "\x1B[1;37m" : ""

OK = GREEN + "OK" + RESET
FAILED = RED + "FAILED" + RESET
SKIPPED = YELLOW + "SKIPPED" + RESET

ERROR = RED + "Error:" + RESET
WARNING = YELLOW + "Warning:" + RESET

# ----------------------------------------------------------------- Tasks ------

task :check do
  tell "Checking if PSPDFKit.framework present"
  assert File.directory?("Frameworks/PSPDFKit.framework"), """
    #{ERROR} Couldn't find #{BOLD}PSPDFKit.framework#{RESET}. Please download the
    PSPDFKit framework and copy it into the #{BOLD}Frameworks/#{RESET} folder.
    https://pspdfkit.com
  """
end

desc "Compile PDFXKit framework (simulator)"
task 'compile:simulator' => [:prepare, :check] do
  tell "Compiling PSPDFKit framework (simulator)"
  run "xcodebuild #{XCODE_FLAGS} -sdk iphonesimulator", :time => true, :quiet => true
end

desc "Compile PDFXKit framework (device)"
task 'compile:device' => [:prepare, :check] do
  tell "Compiling PSPDFKit framework (device)"
  run "xcodebuild #{XCODE_FLAGS} -sdk iphoneos", :time => true, :quiet => true
end

desc "Compile univeral PDFXKit framework"
task :compile => ['compile:simulator', 'compile:device'] do
  tell "Compiling PSPDFKit framework (universal)"
  run "rm -rf #{DIRECTORY}/PDFXKit.framework"
  run "cp -R #{DIRECTORY}/Xcode/Build/Products/Release-iphoneos/PDFXKit.framework #{DIRECTORY}/"
  run "cp -R #{DIRECTORY}/Xcode/Build/Products/Release-iphonesimulator/PDFXKit.framework/Modules/ #{DIRECTORY}/PDFXKit.framework/Modules/"
  run %{lipo -create -output "#{DIRECTORY}/PDFXKit.framework/PDFXKit" "#{DIRECTORY}/Xcode/Build/Products/Release-iphonesimulator/PDFXKit.framework/PDFXKit" "#{DIRECTORY}/Xcode/Build/Products/Release-iphoneos/PDFXKit.framework/PDFXKit"}
end


# desc "build the framework"
# task :build => [:prepare] do
#   xcode_flags = "-scheme PDFXKit -configuration Release -derivedDataPath #{DIRECTORY}/Xcode"
#
#   run "mkdir -p #{DIRECTORY}/Xcode"
#
#   put "Building PSPDFKit framework (simulator) ... "
#   run "xcodebuild #{xcode_flags} -sdk iphonesimulator"
#   puts OK
#
#   put "Building PSPDFKit framework (device) ... "
#   run "xcodebuild #{xcode_flags} -sdk iphoneos"
#   puts OK
#
#   put "Building PSPDFKit framework (universal) ... "
#   run "rm -rf #{DIRECTORY}/PDFXKit.framework"
#   run "cp -R #{DIRECTORY}/Xcode/Build/Products/Release-iphoneos/PDFXKit.framework #{DIRECTORY}/"
#   run "cp -R #{DIRECTORY}/Xcode/Build/Products/Release-iphonesimulator/PDFXKit.framework/Modules/ #{DIRECTORY}/PDFXKit.framework/Modules/"
#   puts OK
#
#   put "Preparing PSPDFKit framework (universal) ... "
#   run "rm -rf #{DIRECTORY}/PDFXKit.framework/PDFXKit"
#   run "lipo -create -output #{DIRECTORY}/PDFXKit.framework/PDFXKit"
#
#   lipo -create -output "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_PRODUCTS}/Debug-iphonesimulator/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework/${PROJECT_NAME}"
#
# end

desc "show help"
task :help do
  run "rake -T", :silent => true
end

task :clean do
  tell "Cleaning"
  run "rm -rf #{DIRECTORY}", :log => false
end

task :prepare do
  tell "Preparing"
  run "mkdir -p #{DIRECTORY}", :log => false
end

# ----------------------------------------------------------- Functions ------

def assert(condition, message = "")
  unless condition
    puts message + "\n\n"
    exit 1
  end
end

def check(condition)
  unless condition
    puts FAILED
    exit 1
  end
end

def run(command, options = {})
  system_options = {}
  system_options[:out] = File::NULL if options[:quiet] && !VERBOSE
  system_options[:err] = File::NULL if options[:quiet] && !VERBOSE

  success = false

  duration = measure do
    success = system("set -e; set -u; set -o pipefail; #{command}", system_options)
    check success unless options[:survive]
  end

  puts "Finished in #{duration}" if options[:time]
  success
end

def put(string)
  print(string)
  STDOUT.flush
end

def log(message)
  puts message if VERBOSE
end

def tell(message)
  puts "#{BLUE}==>#{RESET} #{WHITE}#{message}#{RESET}"
end

def ask(message)
  put message + " [y/n] "
  answer = STDIN.getc
  puts "\n"
  %w[y n].include?(answer) ? answer : ask(message)
end

def read(file_path)
  File.open(file_path, "r", &:read)
end

def write(file_path, string)
  log "Writing file: #{file_path}"
  File.open(file_path, "w") { |file| file.write string }
end

def replace(string, with:, in:)
  file_path = binding.local_variable_get(:in)
  content = read file_path
  content.gsub!(string, with)
  write file_path, content
end

def measure
  start_time = Time.new
  yield
  end_time = Time.new
  duration(end_time - start_time)
end

def duration(total_seconds)
  hours = (total_seconds / 60.0 / 60.0).floor
  minutes = (total_seconds / 60.0 - hours * 60.0).floor
  seconds = (total_seconds - hours * 60.0 * 60.0 - minutes * 60.0).round

  duration = "#{seconds} seconds"
  duration = "#{minutes} minutes, #{duration}" if minutes.positive? || hours.positive?
  duration = "#{hours} hours, #{duration}" if hours.positive?

  duration
end

def invoke(task, *arguments)
  Rake::Task[task].invoke(*arguments)
end
