require './lib/attendee_parser'
require './lib/registry'

class CommandRunner

  def parser
    @parser ||= AttendeeParser.new
  end

  def registry
    @registry ||= Registry.new
  end

  def load(filename)
    parser.parse_file(filename)
    registry.attendees = parser.attendees
  end

  def attendee_count
    registry.attendees.count #Law of Demeter Violation
    # When an object talks to its children to its children
    # Peeking through Registry's internals
  end

end