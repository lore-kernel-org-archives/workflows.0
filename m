Return-Path: <SRS0=aDq+=XR=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF42C3A5A2
	for <workflows@archiver.kernel.org>; Sun, 22 Sep 2019 12:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8AAF20830
	for <workflows@archiver.kernel.org>; Sun, 22 Sep 2019 12:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZk2Z2Li"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbfIVMC4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 22 Sep 2019 08:02:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39520 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbfIVMC4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 22 Sep 2019 08:02:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so11006088wrj.6
        for <workflows@vger.kernel.org>; Sun, 22 Sep 2019 05:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O1rRbMKxPbmsSBm3YBAjakDXKih3BzCun6zSiRyxy4=;
        b=bZk2Z2LiGXwvgz5zFb811wIUxnRfbgoANmCA6RK763/YpPliDADC3KJDzEVxmAl1GR
         Cqj56LLSM0iNS2JaUBDGvjWHdqha3x39B63l9DQA/5/YlYN/Nu0EPs/fKNBFNRnaKqAm
         lKoHTZfDOQCXYlB4d7JwZraVERftFwEyjAPCHzpZAfJgtE6bC40QRlMweMaGV1OI6OyR
         ch8F/LvN8hq8NOMScBQ6DwcaWNgkheFu0a/Uzi4tnqKG6SbpcDm280A9SxVvT+PpNcx4
         0zaQK0BQhRtDlt9JY6WqGbPN2Ylivaq6yuBq2hgZ/ZQhLYtW22kpS6p2Q/oVWTMJgU83
         I0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O1rRbMKxPbmsSBm3YBAjakDXKih3BzCun6zSiRyxy4=;
        b=Y7aXlXrGdHnTF9BhuSjWoBe4Ru+0g8dL4liQHC5AdQIh0XCuW/onXDVjmh1eAMtSzk
         MSmRYaZ/loYqBgjH8OToUyPYI3wm4YneNqN4E0py5Zjgo3MankhQLNlcFrm+Dx457Lb+
         5oZ+1yFc1Az14VA9y3SD1TJkPEAEYub5tfbzx4Q4SY4E8QL1OKuIwaS5LYvhCS9QNg6w
         eJ5wnLqOqkr8ALXQ/bOMKz5yKiebhUjrfunUzgo7mj71EIDjEFO088ctYu+gzpJ83SWA
         8ykKiNiN+fiPlrakz8treRdSvdbzFDh+RJN69op8FyPi/dB+ELLIGtO/dEXdTZNBft53
         0oOg==
X-Gm-Message-State: APjAAAWE/RaTkoWkY1YPcfidKWfMAb9VN9T1qOwuY2rbXxIz2u/7razv
        59XgaFzYbIMljujjU3pmXQQZaM6wp5dJDQ==
X-Google-Smtp-Source: APXvYqxnNgv8ZzbXMe8fDLokoXHHyrgC7qbcEcQZhloEMkhDUe3pxkTA79PBE2/aTJzf9EXTTRQfhw==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr18467745wrn.308.1569153772031;
        Sun, 22 Sep 2019 05:02:52 -0700 (PDT)
Received: from dvyukov-desk.muc.corp.google.com ([2a00:79e0:15:13:aecf:473e:300f:893f])
        by smtp.gmail.com with ESMTPSA id b144sm10474269wmb.3.2019.09.22.05.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 05:02:51 -0700 (PDT)
From:   Dmitry Vyukov <dvyukov@gmail.com>
To:     konstantin@linuxfoundation.org
Cc:     ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] Reflections on kernel development processes
Date:   Sun, 22 Sep 2019 14:02:48 +0200
Message-Id: <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190912120602.GC29277@pure.paranoia.local>
References: <20190912120602.GC29277@pure.paranoia.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

From: Dmitry Vyukov <dvyukov@google.com>

On Thu, Sep 12, 2019 at 08:06:02AM -0400, Konstantin Ryabitsev wrote:
> 
> To follow-up, this is a very rough outline of a proposal that I am going
> to submit to the Foundation in hopes to fund maintainer tool
> development. It follows along some of the lines highlighted in Dmitry's
> talk.
> 
> --------
> 
> # Stage 1 (Normal brain): "local patchwork"
> 
> - Implement a mutt-like tool ("putt"?) that uses locally cloned
>   public-inbox archives to track patches/series submitted to mailing
>   lists
>     - Pre-filters by keywords and paths in patches
>     - Tracks and automatically inserts taglines
>       (Reviewed-by, Acked-by, Tested-by)
>     - Can ignore a patch/series until it sees certain taglines
>       (Tested-by: zeroday bot, Reviewed-by: Trusty Intern)
>     - Automatically tracks latest series and offers an interdiff view
>       between series revisions ("show me what changed between v1 and v2")
>     - Allows responding to patches and conversations a-la mutt
>     - Allows applying patches/series to local repos
> # Stage 2 (Enlightened brain): "now with CI and workflows"
> 
> - Add configurable workflow functionality allowing maintainers to run
>   local or remote tasks on patches and series, before maintainer sees
>   the patches, e.g.:
>     - Create a branch and attempt to apply series
>     - If succeeds, run a batch of CI tests
>     - If succeeds, mark as "CI passed" and show the maintainer
>     - If fails, reject automatically using a "sorry, tests failed"
>       template, including relevant error messages
> 
> - All of the above runs outside of the UI tool ("putt-cid"?) and defines CI
>   routines that can run in cloudy environments or locally using
>   containers.
> - Putt communicates with putt-cid locally or remotely to identify
>   patches/series that the maintainer should review
> 
> 
> # Stage 3 (Galaxy brain): "email as a secondary channel"
> 
> - Support additional distributed communication mechanisms in conjunction
>   with existing mailing lists.
>   - SSB is a peer-to-peer replication framework that has built-in
>     cryptographic integrity and attestation ("immutable git-like
>     chains per participating developer")
>     - offers native support for structured data like bug reports, CI
>       results, code review comments, etc.
>     - can easily support email-to-SSB and web-to-SSB bridges, so
>       developers can choose to participate using familiar tools
>     - has known limitations in v1 of the protocol, but v2 is being
>       actively developed to address them.
>     - or we can take it as a base and develop an SSB-like protocol that
>       better suits distributed development needs.
> 
>   - Radicle is another interesting alternative that creates a mechanism
>     for automating some maintainer tasks by defining "state machines,"
>     e.g.:
>     - automatically merge a revision if all tests pass and at least 2
>       Reviewed-by's are seen.
>     - May have been sipping the blockchain cool-aid a bit too much
>       ("Immutable append-only records").

Hi Konstantin,

Also adding people from the "Kernel development collaboration platform
wish list" discussion on the workflows list [1].
(Rafael et al, thanks for collecting the requirements, that's very useful!)

I second the idea expressed by several people that addressing the
contributor side is a very important part of this effort.

While I understand the intention to provide something useful as fast
as possible, I also a bit afraid that the Stage 1 ("putt") diverges
us into investing into particular UI, tying capabilities with this UI
and not addressing the fundamental problems.
People are expressing a preference for different types of UIs
(CL, terminal GUI, web, scripting), I think eventually we will have
several. So I would suggest to untie features/capabilities from
any particular UI as much as possible, and start with addressing more
fundamental aspects. Building richer features on top of the current
human-oriented emails is also going to be much harder, and that's the
work that we eventually will (hopefully) throw away.

From UI perspective I think we should start with a CL interface because
(1) it's the simplest to build (we don't invest too much into it,
don't shift focus and will shake down more important things faster),
(2) there are some important actions that are best done with CL
anyway (e.g. mailing a patch). Later it may serve as an
entry point for starting the richer terminal GUI or other types of GUIs.

There are 3 groups of people we should be looking at:
- contributors (important special case: sending first patch)
- maintainers
- reviewers

I would set the first milestone as having the CL utility (let's call
it "kit"*) which can do:

$ kit init
# Does some necessary one-time initialization, executed from the
# kernel git checkout.

$ kit mail
# Sends the top commit in the current branch for review.

So that would be the workflow for sending your first kernel patch.

Later "kit mail" can also run checkpatch, check SOB tag, add some kind
of change ID or anything else we will consider necessary. It may be
necessary to be able to force-override some of the checks, but by default
you are now getting patches that have SOB, checkpatch-clean, etc.

If there is an easy way to make it work with the current email-based
process (i.e. send email on your behalf and you receive incoming emails),
then we could do that first and give it to new developers to relief from
setting up email client. Otherwise, we should continue developing it
based on something like SSB (or whatever protocol we will choose).

Obviously, the intention is that if you do "kit mail" second time
with a changed patch, it sends "V2". Or if you have multiple local
commits it will properly mail the series (or V2 of the series).

Most (all) of the "kit" functionality should be separated from the UI
and be available for scripting/automation/other UIs. Whether it's
done as "libgit" or as "shell out" is discussable.

On the protocol side I don't have strong preference for SSB or
something similar custom. It seems that we will use SSB in somewhat
simplified way, i.e. global connected graph, rather than several large
groups or small isolated groups. We won't need Facebook-like following
nor Pubs announcements. You obviously don't want to be notified of all
messages in the system (LKML), but still it's a global graph in the
sense that you can receive anything if you want or CC anybody.
That limited subset of SSB should be easier to implement.
So as Konstantin said, we could fork SSB to better fit our needs.
The more important part will be the application-level protocol that
we will transfer inside of SSB messages, which is mostly transport
protocol for our needs (at least for the majority, maybe not for
Konstantin's concerns :)).

I would suggest to put bug/issue tracking aside for now (it's an
important thing, but it should be possible to add it later) and also
"bare chatting" (which can be done over emails for now) and
concentrate on patches just to make things simpler. Patches are
the cornerstone of the process.

So we need to define the format of the "patch for review" SSB message
which "kit mail" will form and push. It should be mostly easy
(patch itself, base revision, ID, CC, reference to previous version,
Fixes, etc). But there may be some more interesting aspects,
e.g. we will need some notion of "subsystems" for notifications,
some representation of comments on code and probably some other
things that I can't think of now.
Other developers will "reply" to the patch with "acked", "reviewed",
"merged", "review delegated" meta messages. Referring to the recent
"Notification of your branch being tested by zero day bot?"
discussion [2] CI systems will post "testing started" (with a link
to their status page or something), "testing finished" (with clear
OK/FAIL signal, and a link for FAIL).

If/when we have this, most of the mentioned features should be almost
trivial to implement. E.g. collecting all of Acked/Reviewed tags,
adding them and forming final patch; or showing version-to-version diff;
or doing "local patchwork" with nice features like "don't show it to
me if I already reviewed it"; or presenting "testing on CI X started
1 hour ago" when you are looking at a patch wondering about its status.
I guess generally you don't want this as a separate notification as long
as you can get access to this bit of info whenever you need to. This may
also be relevant for e.g. "don't notify me about Acked-by somebody
else if I am just a reviewer of the patch", instead we could deliver
Acked-by only to author and maintainer. Not saying that we should do
exactly this, just some examples of nice things that become very easy
to add for everybody (and very hard to add with emails).

The next important thing we will need is email bridge.
I see it as separate service that receives all SSB messages and e.g.
flattens "patch for review" message and sends as email. It will also
form "Acked-by" email from "acked" SSB message, etc. It will also
need to proxy incoming emails. In some cases it may be possible to
figure out the semantics of the email (e.g. only "Reviewed-by" line),
for other cases it probably should be injected as a "freeform comment"
message).
After sending a patch email, the bridge could send "email Message-ID/
lore link" SSB message for tracking purposes, which will link both
systems together.
This email bridge is also a nice point for opt-in for all optional
notifications. E.g. CIs always send "testing started" SSB message,
but for emails you can opt-in/out as you want.

It seems that all other services could operate in roughly the same way.
Namely, a CI system will receive push notifications about all patches,
inject "testing started" message back, then "testing finished" message
later. A new version of the patch can easily abort testing of the previous
version, or at least prevent notifications on the stale version.
A small thing Linus mentioned as annoying is getting "your patch broken"
notifications for patches known to be broken; this can easily be
addressed with a "don't bother testing" bit on the patch.

Similarly, a number of people mentioned that having all patches/series
in git would be very useful. So a git bridge could receive push
notifications about all patches, import them into some git tree
on kernel.org and inject a reply with git branch name back.

One requirement Konstantin mentioned is that it would be good if the
system will be able to operate in some kind of global doom scenarios
(e.g. a remote Linux code execution affecting all versions and being
actively exploited). From this point of view, I think it's important
that these bridges are separate from the core part, if any of these
goes down the system partially degrades but keeps core functions.

Regarding "state machines" in the protocol (Radicle/IPFS), I think
it's not just "sipping the blockchain cool-aid a bit too much",
it's a wrong tool for our needs. Smart contracts are used for
crypto-currencies where one does want to carve the rules in the
blockchain. But we don't want and don't need this.
The blockchain itself (passive data) can't merge changes, so we will
need some kind of active service for this. Now this active service
is also a good place to do the required checks (reviewed+tested).
So we do not need these rules in the blockchain itself.
We also don't want them to be carved because they may change.
Consider, you require "CI X to pass". Now CI X goes down and
the process stalls because this requirement is carved in stone.
What we would want to do instead is to change the service config
to ignore CI X for now.
Not saying that removing smart contracts from the protocol will
significantly simplify its design, requirements for formal verification,
number of tricky corner cases and general understandability.

Another important part of the system is user identities.
Do we go with a public/private key pair? Or we have some other realistic
alternatives? Assuming we go with key pairs for now, "kit init"
will generate a local key pair for you (a new developer). But a user
should be able to evacuate/export the private key later and pass
an existing key (to bootstrap a new machine with the same identity).
However, we will probably need another identity that is slightly
easier to remember and type in patch CC line than 256-char hash.
And that probably needs to be an email address (required for sending
email notifications anyway). But I don't know how to ensure uniqueness
of emails in this system. An alternative would be to use usernames
(e.g. "torvalds" or "tytso") and then a user can map that to own email
as they want. But this does not remove the requirement for uniqueness.

Two more interesting/controversial possibilities.
If we have an email bridge, we could also have a github bridge!
Don't get me wrong, I am not saying we need to do this now or at all.
I am saying that if UI part is abstracted enough, then it may be
theoretically possible to take a PR on a special dedicated github
project, convert it to "patch for review" SSB message and inject
into the system. Comments on the patch will be proxied back to github.
Andrew will receive this over email bridge and review and merge,
not even suspecting he is reviewing a github PR (w00t!).

Second controversial idea: the local rich GUI/patchwork is actually
web-based _but_ it talks to a local web server (so fast and no internet
connection required) _and_ it resembles terminal UI and has tons of
hotkeys and terminal-like navigation (so it kinda feels like terminal).
You start it with "kit gui" which starts a browser for you.
The advantage of this: we build 1 UI instead of 2, so immediate 2x
time savings. Also consistency between the UIs: you go to web, you see
exactly the same UI that you used to work with locally (now it's just
powered by a remote web server).

Phew! I think that's it. Does any of this make sense to you?
Thanks for your attention!

* "kit" is short and easy to remember, stands for "equipment/tool kit",
also refers to "git" with "k" for "kernel", or "kernel it" ("kernel thingy")

[1] https://lore.kernel.org/workflows/5072394.GngetUhsyG@kreacher/T/
[2] https://lore.kernel.org/workflows/20190919032100.GC7453@intel.com/T/
