# #!/bin/sh

cd $(dirname $0)
insdir=$PWD/bin
mkdir -p $insdir

function link {
    ln -sf $PWD/$fn $insdir/$(basename -s .h $fn)
}

for fn in `cat bin.list`; do
    link $fn
done

echo "Finish installing. Links created on ${insdir}"


