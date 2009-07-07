package SparkX::Form::Field::Textarea;

use Moose;
use HTML::Tiny;

extends 'Spark::Form::Field';
with 'Spark::Form::Field::Role::Printable::HTML',
     'Spark::Form::Field::Role::Printable::XHTML',
     'Spark::Form::Field::Role::Validateable';

has '+value' => (
    isa => 'Str',
    default => '',
);

sub to_html {
    shift->_render( HTML::Tiny->new( mode => 'html') );
}

sub to_xhtml {
    shift->_render( HTML::Tiny->new( mode => 'xml') );
}
 
sub _render {
    my ($self,$html) = @_;
    
    $html->textarea({name => $self->name},$self->value);
}

sub validate { 1 }

1;
__END__

=head1 NAME

SparkX::Form::Field::Textarea - A Textarea field for SparkX::Form

=head1 METHODS

=head2 to_html() => Str

Renders the field to html

=head2 to_xhtml() => Str

Renders the field to xhtml

=head2 validate() => Bool

Validates the field. Before composition with validators, always returns 1.

=head1 SEE ALSO

L<SparkX::Form> - The forms module this is to be used with
L<SparkX::Form::BasicFields> - A collection of fields for use with C<Spark::Form>

=cut
