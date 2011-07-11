package Spark::Couplet::Plugin::ArrayRef;

use Moose::Role;
with 'Data::Couplet::Role::Plugin';

sub add_arrayref {
    my ($self,$key,$value) = @_;
    my $v = $self->value($key) || [];
    $self->set($key, [@$v,$value]);
}

sub get_arrayref {
    my ($self,$key) = @_;
    @{$self->value($key)||[]};
}

no Moose::Role;

1;
__END__