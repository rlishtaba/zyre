################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module Zyre
  module FFI

    # Parsing Zyre messages
    # @note This class is 100% generated using zproject.
    class Event
      # Raised when one tries to use an instance of {Event} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::Zyre::FFI.zyre_event_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Constructor: receive an event from the zyre node, wraps zyre_recv.
      # The event may be a control message (ENTER, EXIT, JOIN, LEAVE) or
      # data (WHISPER, SHOUT).
      # @param node [Zyre, #__ptr]
      # @return [Zyre::Event]
      def self.new(node)
        node = node.__ptr if node
        ptr = ::Zyre::FFI.zyre_event_new(node)
        __new ptr
      end

      # Destructor; destroys an event instance
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::Zyre::FFI.zyre_event_destroy(self_p)
        result
      end

      # Returns event type, as printable uppercase string. Choices are:
      # "ENTER", "EXIT", "JOIN", "LEAVE", "EVASIVE", "WHISPER" and "SHOUT"
      # and for the local node: "STOP"
      #
      # @return [String]
      def type()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_type(self_p)
        result
      end

      # Return the sending peer's uuid as a string
      #
      # @return [String]
      def peer_uuid()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_peer_uuid(self_p)
        result
      end

      # Return the sending peer's public name as a string
      #
      # @return [String]
      def peer_name()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_peer_name(self_p)
        result
      end

      # Return the sending peer's ipaddress as a string
      #
      # @return [String]
      def peer_addr()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_peer_addr(self_p)
        result
      end

      # Returns the event headers, or NULL if there are none
      #
      # @return [::FFI::Pointer]
      def headers()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_headers(self_p)
        result
      end

      # Returns value of a header from the message headers
      # obtained by ENTER. Return NULL if no value was found.
      #
      # @param name [String, #to_s, nil]
      # @return [String]
      def header(name)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_header(self_p, name)
        result
      end

      # Returns the group name that a SHOUT event was sent to
      #
      # @return [String]
      def group()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_group(self_p)
        result
      end

      # Returns the incoming message payload; the caller can modify the
      # message but does not own it and should not destroy it.
      #
      # @return [::FFI::Pointer]
      def msg()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_msg(self_p)
        result
      end

      # Returns the incoming message payload, and pass ownership to the
      # caller. The caller must destroy the message when finished with it.
      # After called on the given event, further calls will return NULL.
      #
      # @return [::FFI::Pointer]
      def get_msg()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_get_msg(self_p)
        result
      end

      # Print event to zsys log
      #
      # @return [void]
      def print()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_event_print(self_p)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::Zyre::FFI.zyre_event_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
