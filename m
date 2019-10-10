Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3895C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 17:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DDD22067B
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 17:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gzkv9tXX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbfJJRjh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 13:39:37 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]:40168 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfJJRjg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 13:39:36 -0400
Received: by mail-qt1-f175.google.com with SMTP id m61so9882390qte.7
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=dIFtEbX5u7TnaLkHdHUprEmMLEChSdij1wZebNmmdek=;
        b=Gzkv9tXXrf1LQphGb4SoP4nfKO1LTa1k0EdzYjiQC0YLqtMK2K1ZufgztSvSDuPexa
         bqixo5E/xZ52+ANSMvr7j2YrEESIM8NsB1cCzU7ZaUCy2yENmPux8NZsIGgngbBXHXdx
         wDxOpdel+nTMm332B5SzUGZpEucGExZgRP96Tben3J6GwB0nlMZdNnJxMwRXNmfO7d0Y
         5F6C8C8NEFgnWmL2jClNPn2JeIeuOkN7hYzhm66KLiA02H7TOpYY5JrJVwN6SAT0Qs4d
         OICwreK38fyy2p0e6GufhdMYrk0cM3rpwdjf1+HPdIBAVbPu7N1WCnhycaWc7QinfT6E
         QHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=dIFtEbX5u7TnaLkHdHUprEmMLEChSdij1wZebNmmdek=;
        b=AqIA7ey7V0T1iiCQYpPNpWRiNmoc1bKP3fC/itOCZnvnag1icayhSGXo4hX8YfshKc
         8Q3LWkuQ1+2nCWOEuJNj4EMsQZWUmvDU8fxgk5ZTFbiQ7uIHn6csuvJ0Xlb22z544B8X
         NyjxOoPfR5doLa51XaswwzwRUkyCnQMoaSC4IcUwzfWMiDakf5BZJNpBzuXa5YxYRUqq
         NvbCOr+h+rM9pVNw+TrIX0xTJ+TcBzUTUhv8YJe3o4NLi8fbnS62LirnVrrOWggCI6be
         iNQglrt/Y1Xn0DZNn0AqQx/zTfipVfxFkTvxKOS1dusO/EwyxKkefJYXfkZ8TnAagJ0W
         i3fA==
X-Gm-Message-State: APjAAAVVqEXz9e/29TUq8NHvUjZ08CsqLmhDWiBSXSGMHF0XQZfjcXnI
        q3lFCBzfQIz4XTHM76mtW4SaWqT5AtzsRYbzKM2TAmTJ
X-Google-Smtp-Source: APXvYqzOwUX0AkvLlEOGo0kWVvv0+LlZgOUHT/4wnLLdUSUzuHNEvziG/BWYybOIwmDVDgX84zXFCnnIrgE5A1cEZAU=
X-Received: by 2002:a0c:fec3:: with SMTP id z3mr11585214qvs.122.1570729173952;
 Thu, 10 Oct 2019 10:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+Y0_2rCnt3p69V2U2_F=t4nMOmAOL-RGwxSS-ufk41NAg@mail.gmail.com>
In-Reply-To: <CACT4Y+Y0_2rCnt3p69V2U2_F=t4nMOmAOL-RGwxSS-ufk41NAg@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 10 Oct 2019 19:39:22 +0200
Message-ID: <CACT4Y+ZVbTk1esf9sDvDbXMCRDvFZwE1SbjxMAFbYjzK7AKoYA@mail.gmail.com>
Subject: Fwd: SSB protocol thoughts
To:     workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Theodore Ts'o" <tytso@mit.edu>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi,

I've spent some time reading about SSB protocol, wrote a toy prototype
and played with it. I've tried to do a binary protocol and simpler
connection auth/encryption scheme. Here are some thoughts on the
protocol, how we can adopt it and associated problems. Some of the
problems we don't need to solve right now, but resolving others seem
to be required to get anything working. I am probably also
overthinking some aspects, I will appreciate if you can stop me from
doing this :)

1. The connection handshake/auth/encryption scheme:
https://ssbc.github.io/scuttlebutt-protocol-guide/#handshake
https://ssbc.github.io/scuttlebutt-protocol-guide/#box-stream
My current view is to take these parts as is. We do have a simpler and
less secret context, namely:
 - network key (project key in our context) is not a secret, we don't
need to hire Linux kernel project key
 - peer public key is not secret, we will publish public keys of all pubs
 - the data stream does not need encryption (?): all of the data will
become public anyway, if we have special encrypted messages, then they
are encrypted on its own anyway, though we do need authenticity
signatures to avoid man-in-the-middle spoofing, so we do need the
box-stream part in some form anyway
Based on that it may be possible to design something a bit simpler
(less than 4 messages for handshake), but not radically simpler. And
since I am not crypto expert I would take the existing proven scheme.

2. The next layer is a simplistic RPC protocol:
https://ssbc.github.io/scuttlebutt-protocol-guide/#header-structure
9 bytes binary header: 1 byte flags, 4 bytes request number, 4 bytes size.
There are some things I would change: there is no request type
(supposed to be inferred from contents); the body encoding (binary,
utf-8, json) looks strange (what does binary mean? what's in that
utf-8 string).
There is also a question if we need RPC layer at all. We don't need
following, pub announcements, blobs, etc. It seems that the only thing
we need from the transport is spreading messages. So potentially we
could skip the RPC layer and just make both peers exchange messages
the other side is missing.

3. Blobs.
https://ssbc.github.io/scuttlebutt-protocol-guide/#blobs
I would drop blob support from the system. In SSB peers store and
exchange blobs. If we do blobs (e.g. a core dump for a bug report), it
looks more reasonable to offload blob storage to a separate system.
One option: a user uploads the blob somewhere and then just includes a
link in the message. Option 2: we also provide some blob storage, but
user still uploads separately and still provides a link.
Application-level systems may even know that BLOB SHA1-HASH-XXX can be
downloaded from https://kernel.org/blob/XXX, but that still happens
outside of the SSB protocol itself.

4. DoS protection.
Taking into account this completely distributed and p2p nature of
everything, it becomes very easy to DoS the system with new users (one
just needs to generate a key pair), with lots of messages from a
single user, or both. And then these messages will be synced to
everybody. Eventually we will need some protection from DoS. Not that
it's not a problem for email, but it's harder to create trusted email
accounts and email servers have some DoS/spam protections. If we move
from email, it will become our responsibility.

5. Corrupted feeds.
Some feeds may become corrupted (intentionally or not). Intentionally
it's actually trivial to do -- if you are at message sequence 10, you
push 2 different but correctly signed message sequence 11 into
different parts of the p2p system. Then there is no way the whole
system will agree and recover on its own from this. Different parts
will continue pushing to each other message 11 and 11', concluding
that the other one is invalid and rejecting it.
Konstantin also mentioned the possibility of injecting some illegal
content into the system, and then it will become "poisoned".
The system needs to continue functioning in the presence of corrupted feeds.
A potential solution: periodically scan major pubs, detect
inconsistencies and corrupted feeds and publish list of such feeds.
E.g. "feed X is bad after message 42: drop all messages after that,
don't accept new and don't spread them". This may also help recovering
after a potential DoS.
However this may have implications on application-level. Consider you
reply to a comment X on a patch review, and later message with comment
X is dropped from the system.

If we get to this point, then it seems to me we already have an email
replacement that is easier to setup, does not depend on any
centralized providers, properly authenticated and with strong user
identities.

Some additional points related to the transport layer:

6. I would consider compressing everything on the wire and on disk
with gzip/brotli.
I don't see any mention of compression in SSB layers, but it looks
very reasonable to me. Why not? At least something like brotli level 3
sounds like a pure win, we will have lots of text.

7. Synchronizing messages.
SSB probably assumes that one has a par of a hundred followers. The
gossip/epidemic protocol uses vector clocks of {feed,sequence} to
communicate what messages a peer already has. This may become a bit
problematic b/c in our context everybody syncs with everybody. I would
imagine over the years we have on a par of tens of thousands of feeds
(all users x multiple devices), which becomes >100KB of vector clock
on each sync.
We don't need to solve it from day 1, but may be something to keep in
mind. It seems that it should be solvable, but I failed to figure out
all the details. Option 1: since the most common case is that a user
synchronizes with the same pub repeatedly, it could just say "I
synched with you an hour ago and we stopped on message X, now just
send me everything new you have since X". Option 2: a pub could
publish, say, daily vector clocks of its contents and assign some ID
to each such vector clock; then a client could express own vector
clock as a diff on top of the last pushed vector clock. This would at
least get rid of historic/inactive feeds (everybody has them already).

8. Somebody mentioned a possibility of partial syncs (if the total
amount of data becomes too large, one may want to not download
everything for a new replica).
I hope we can postpone this problem until we actually have it.
Hopefully it's solvable retrospectively. For now I would say:
everybody fetches everything, in the end everybody fetches multiple
git repos in its entirety (shallow checkouts are not too useful).

9. Encrypted content.
For context: if you have not yet seen "One of the most brilliant
presentations during #KR2019!" by Thomas re insanity setting up
encrypted communication today, that's highly recommended:
https://www.youtube.com/watch?v=D152ld9eptg
It seems that SSB can be a perfect medium for sane encrypted
communication. I can see that it can reasonably support both
"security@kernel.org" and "spectre/meltdown havoc" use cases (in the
former case anybody can start a new discussion).
Something along the following lines: one creates a new "enclave" which
is identified with a keypair. In the case of security@kernel.org the
public key is published, so that anybody can post. In the other case
the public key is not published, so only members can post. The keypair
can be shared with a user X by publishing the keypair encrypted with
X's public key. Now X knows the key and can decrypt messages.
There are few things to figure out: who can create new enclaves, who
can add members, do we use keypair per enclave or per each thread in
the enclave (the latter would be a requirement for security@kernel.org
but also allows to "revoke" membership).
Note: this is somewhat different from what SSB supports for encrypted messages:
https://ssbc.github.io/scuttlebutt-protocol-guide/#private-messages
There you choose recipients for each message when it's send and it's
not possible to add anybody later. I see it a bit more like encrypted
mail archive: you can later give access to key to other people.
Encryption probably needs to be just an encapsulation wrapper around
any other message type that can be published in the system. This way
one can also "file bugs" and "mail patches for review" inside of an
encrypted enclave, and if you can decrypt them, then your "local
patchwork" will show them just as any other bug/patch.
Again, don't need this in version 1, but it seems that implementing
this is less work than setting up encrypted email list for the next
havoc :)

10. Binary vs json.
If I am not mistaken this the proposal for binary SSB (aka SSB2?):
http://htmlpreview.github.io/?https://github.com/ssbc/ssb-spec-drafts/blob/master/drafts/draft-ssb-core-gabbygrove/00/draft-ssb-core-gabbygrove-00.html
We can choose banary or json encoding separately for feed message
headers and for application level content. It seems to me that it
makes lots of sense to use binary encoding for the headers:
https://ssbc.github.io/scuttlebutt-protocol-guide/#source-example
The header nicely maps onto a struct, saves space and complexity (the
signature calculation over canonical json formatting which is defined
by the ECMA-262 6th Edition section JSON.stringify alone worth a lot!)
and is processed uniformly by the lowest level of the system.
However, I am not sure about application-level content (descriptions
of patches, comments, CI results, etc). I would actually leave them as
json for better debuggability, transparency, extendability, different
clients in different languages, etc. It should not be to bad
space-wise if combined with compression on the wire/disk. In the end
we don't do million messages per second.

11. "Same as".
SSB proposal for associating multiple feeds with the same user:
http://htmlpreview.github.io/?https://github.com/ssbc/ssb-spec-drafts/blob/master/drafts/draft-ssb-app-same-as/00/draft-ssb-app-same-as-00.html
I think we need this from day 1. But this seems to be relatively easy
to do and I don't see any tricky design aspects. In short: on your
first machine you generate a special file that allows you to create
"the same as" feed on another machine later. The file contains
something signed with the private key. Normally you would generate
several such backup files right away and save in some reliable places.

12. User identities.
The main identity of a user is the pub key. However, you don't want to
type them in CC line. Part of this can be solved with UI: you type in
email, but it replaces it with the pub key. Maybe I am over-thinking
the problem. However, let's say I claim in the system that my email is
"tglx@linutronix.de". Now any Reviewed-by me will result in
"Reviewed-by: tglx@linutronix.de" on patches? Or how do we ensure that
2 users don't claim the same email? Or how do we ensure that my
claimed email is actually my? Or how do we deal with people changing
companies and emails?

13. Permissions/rights.
Again, not day 1 need, but I would expect that sooner or later we will
need some kind of permissions in the system: who is the owner of the
subsystem and can delegate reviews, etc? who can create new
subsystems? who can create encrypted enclaves?
An interesting possibility is to create a "root" user with public key
matching "network" key, this key is verified on every handshake
between any peers to ensure that belong to the same network. In SSB
this is just a random key, but if we add a corresponding private key
and user feed, than this naturally becomes "root" user that anybody
can verify and trust. This "root" user may be source of all
permissions and grant them as necessary by posting special messages.
However, there may be a potential issue with revoking permissions,
which is related to the next point.

14. Consistency.
Consider there is a bug/issue and 2 users post conflicting status
updates concurrently. As these updates propagate through the system,
it's hard to achieve consistent final state. At least I fail to see
how it's possible in a reasonable manner. As a result some peers may
permanently disagree on the status of the bug.
May also affect patch reviews, if one user marks a patch as "abandon"
and another sets some "active" state. Then a "local patchwork" may
show it as open/pending for one user and closed/inactive for another.
May be even worse for some global configuration/settings data,
disagreement/inconsistency on these may be problematic.
There is a related problem related to permission revocations. Consider
a malicious pub that does not propagate a particular "permission
revocation" message. For the rest of participants everything looks
legit, they still sync with the pub, get other messages, etc, it's
just as if the peer did not publish the revocation message at all. As
the result the revocation message will not take effect arbitrary long.
These problems seem to be semi-inherent to the fully distributed system.
The only practical solution that I see is to ignore the problem and
rely that everybody gets all messages eventually, messages take effect
when you receive them and in that order, and that some inconsistencies
are possible but we just live with that. However, it's a bit scary to
commit to theoretical impossibility of any 100% consistent state in
the system...
I see another potential solution, but it's actually half-centralized
and suffers from SPOF. When a user issues "bug update" message that is
just a request to update state, it's not yet committed. Then there is
a centralizer server that acknowledges all such requests and assigns
them totally ordered sequence numbers (i.e. "I've received message X
first, so I assign it number 1", "then I received message Y and it
becomes number 2"). This ordering dictates the final globally
consistent state. This scheme can be used for any other state that
needs consistency, but it's a centralized server and SPOF, if it's
down the requests are still in the system but they are not committed
and don't have sequence numbers assigned.
Obviously, all of this become infinitely simpler if we have a "forge"
solution...

Kudos if you are still with me :)
