::                                                      ::  ::
::::  /app/dummy-coll/hoon                                    ::  ::
  ::                                                    ::  ::
::
::  utility to populate mve clients (collections and hall) with 
::  dummy data for the purpose of testing
::
::
::::
  ::
/-  collections
/+  down-jet, frontmatter, colls
::/=  cols   /:  /===/web/collections  /collections/
::
=,  space:userlib
|%
  ++  move  (pair bone card)
  ++  pear
    $%  {$collections-action action:api:collections}
    ==
  ++  dummy-post
    {des/@t tit/@t bod/@t}
  ++  card
    $%  {$peer wire dock path}
        {$poke wire dock pear}
        {$info wire ship term nori:clay}              ::
    ==
  ++  cmd
    $%  {%collections {config:collections path}}
        {%circles path}
    ==
  :: given a desc, pull a corresponding desc
  :: (not great, but we're dumb)
  ::
  ++  pull-coll
    |=  {comap/(map @da collection:collections) desc/@t}
    ^-  (unit (pair @da collection:collections))
    =/  c  %+  skim
             ~(tap by comap)
           |=  (pair @da collection:collections)
           =(desc.conf.q desc)
    ?~  c
      ~
    `i.c
  :: TODO load these from a directory of sample files
  :: no whitelist/blacklist for now
  ++  blog-one-config
    ^-  config:collections
    :*  'Urth Dot Net'
        &
        &
        &
        |
        *(set @p)
    ==
  ++  paths-with-comms
    |=  pax/path
    ^-  (list (pair @ta $~))
    %+  skim
      %~  tap
          by
          =<  dir
          .^(arch %cy pax)
      ==
    |=  a/(pair @ta $~)
    =/  b  .^(arch %cy (weld pax ~[p.a])) 
    (~(has by dir.b) 'comments')
  ++  no-sig-trail
    |=  t/@t
    ^-  @t
    =/  s
    (trip t)
    ?:  =((trip (snag 0 (flop s))) "~")
      %-  crip
      %-  flop
      %+  slag
        1
      %-  flop
      s
    t
--
::
|_  {bol/bowl:gall state/@ud}
::
++  poke-noun
  |=  [input/path oup/path]
  ^-  (quip move _+>)
  :-  %+  turn
        (tree input)
      |=  a/@t
      (pat-move (stab a) oup)
  +>
::
:: cord to nice da cord
:: remove trailing sig, make sure that subsec of da 
:: won't trigger a render
++  sanitize
::  turn a list of paths into moves
  |=  a/@t
  ^-  @t
  %+  scot
    %da
  %-  nice-da:colls 
  %+  slav
    %da
  %-  no-sig-trail
  a
++  pat-move
  |=  [in/path outdir/path]
  ^-  move
  :: check if it's a comment
  =/  typ  
  (snag 2 (flop in))
  =/  outpath
  ?:  =(typ 'comments')
    ::/biz/bar/bing/foo
    ;:  welp  outdir
              :~
              %-  sanitize
              %+  snag
                3
              %-  flop
              in
              %+  snag
                1
              %-  flop
              in
              ==
              /collections-comment
    ==
  ;:  welp  outdir
            :_  ~
            %-  sanitize
            %+  snag
              1
            %-  flop
            in
            /collections-topic
  ==
  ~&  [%outpath outpath]
  ::*move
  :-  ost.bol
  :^    %info
      in
    our.bol
  (foal outpath -:(flop outpath) !>((?:(=(typ 'comments') md-to-comm:colls md-to-post:colls) .^(@t %cx in))))    ::  XX type
::++  outpath
++  tree
  |=  pax/path
  |-  ^-  (list @t)
  =+  ark=.^(arch cy+pax)
  ?~  fil.ark
    %-  zing
    %+  turn
      (sort ~(tap by dir.ark) aor)
    |=  {a/@t $~}
    ^$(pax (welp pax /[a]))
  :: output as cord to prevent zing from borking
  ~[(spat pax)]
--
