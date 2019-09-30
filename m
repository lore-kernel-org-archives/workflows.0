Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974F8C32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 20:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D91B224FE
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569876421;
	bh=ipcGWhR408YotY0Qv+xp0gPzqr+8EdQ58u7A4kAOtMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IDv4o6KrPJRrFTs8DNSXe7jX+pM/qOAmoCW8Sx8vR/pWeIdXy3MWe9raNtCtBurW3
	 5vuWhFAlzgvKb2F+E8bHsb4Rp7wGOotSJCunGH6afbJTD4eeuLwZN0fM1VkTDJaOjV
	 aH66xkhbd9j2p9DsZDUoS7fiB0m1HLBHU3OGDF4w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfI3UrA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 16:47:00 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36166 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfI3UrA (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 16:47:00 -0400
Received: by mail-qt1-f194.google.com with SMTP id o12so18845356qtf.3
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IhU862GRzfRKwSzg/U/MPU8Kv+xGIbR4msojbf5rsUA=;
        b=XhMNX9RgSB+mA4ko0QTWAvxepq8xxhEkKKsl4kqXBBcS/0jgSaJsZHszFci7q79g2u
         JWVaKxM2hUtNtPOv/LQ0i4KwmVgIs8JbA3jueAgsbG2shTHP54R/ZI56u1mKdsmxi4Td
         bag/u+eesSNX2Pnxr3nQzAr+BP0VMh6lPZhFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IhU862GRzfRKwSzg/U/MPU8Kv+xGIbR4msojbf5rsUA=;
        b=dInueYgHPEUIdsw+46WNO1XBK4r4GI0xhuU6NSuU0i3hXTwdNgIq2qOJtpB5XqAFUz
         nK9iq2pAhuVZk1hCQj7WXmb+i3pYdNMuPfo/bqQEk7vEyZFR2rzTdatt8l9S95KRAsP8
         liNMuXTEjGUzsefVVlmfy+vbXo3s63mp6u/B0cOM/HQed4A8kaRJPN9+5jNedzIVrb0R
         c9oRFq3l+albAP+Cxu/SHw/aLo5aJWSz8FFijv7VuUVrJPliC0zCboi36WoV3CNTen3O
         EXFqCSlH1c/GeRDZTYELhOTNT7skK4p2yzhSjXa3YmuOwsT30+PnuGm/gJA8Iom67k0C
         8KPw==
X-Gm-Message-State: APjAAAVl9ZhmVzqboB4XNugf6+D8Qj4QLDjEhKEsUhryECBm+zVZiAeF
        lhe+ZlNCnFvQbLcWTTfBXKpItUnKJz2drA==
X-Google-Smtp-Source: APXvYqy3/FclBe79MBMSOhS/jLMgJuK0doZ1NkoYZ5s+Qt4rcgMAh/WPc9vC2E+3kQB9V32yQvYB3Q==
X-Received: by 2002:ac8:7346:: with SMTP id q6mr26519403qtp.323.1569875094203;
        Mon, 30 Sep 2019 13:24:54 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id m63sm6707310qkc.72.2019.09.30.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 13:24:53 -0700 (PDT)
Date:   Mon, 30 Sep 2019 16:24:51 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@gmail.com>
Cc:     tytso@mit.edu, robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20190930202451.GA14403@pure.paranoia.local>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

In retrospect, taking a week offline vacation right after getting
everyone excited about workflow tooling was not the best timing. :) I'm
slowly catching up to all the good conversations that took place while I
was enjoying the fine beaches of South-West Iberian peninsula.

On Sun, Sep 22, 2019 at 02:02:48PM +0200, Dmitry Vyukov wrote:
> While I understand the intention to provide something useful as fast
> as possible, I also a bit afraid that the Stage 1 ("putt") diverges
> us into investing into particular UI, tying capabilities with this UI
> and not addressing the fundamental problems.
> People are expressing a preference for different types of UIs
> (CL, terminal GUI, web, scripting), I think eventually we will have
> several. So I would suggest to untie features/capabilities from
> any particular UI as much as possible, and start with addressing more
> fundamental aspects. Building richer features on top of the current
> human-oriented emails is also going to be much harder, and that's the
> work that we eventually will (hopefully) throw away.

Yes, I fully agree. My perspective is a bit limited in this regard,
because I am not a kernel contributor, so I only hear what the
maintainers complain about. That said, I am also prioritizing the kind
of effort that we can get funded -- and high-profile Linux kernel
developers have access to a lot of important ears. I am working through
my backlog of emails to fine-tune my tool development proposal, which I
hope will allow me to get some funds via LF channels.

> There are 3 groups of people we should be looking at:
> - contributors (important special case: sending first patch)
> - maintainers
> - reviewers
> 
> I would set the first milestone as having the CL utility (let's call
> it "kit"*) which can do:

I think we should call it kthul (pronounced k-tool, easy to type, and
powerful enough to summon the Great Ones). :) Mostly kidding, except
perhaps that "kit" is not websearch-friendly, so people googling for
docs would have an easier time finding hits for "kthul".

> $ kit init
> # Does some necessary one-time initialization, executed from the
> # kernel git checkout.
> 
> $ kit mail
> # Sends the top commit in the current branch for review.
> 
> So that would be the workflow for sending your first kernel patch.

I would argue that "sending your first patch" should be a hosted web
service. A while back we discussed this in some detail -- it would be a
simple site that would basically accept a handful of fields:

- your name
- your email address
- the URL of your linux fork (e.g. on Github/Gitlab)
- (optionally) the commit id, if not master
- (optionally) a text field for the cover letter
- (optionally) message-id of the previous patch/series revision

The service would create the patch/series based on this input, run
checkpatch, validate that the provided email address is valid, and then
submit the patch/series to the proper list(s) based on get_maintainer
results.

The reasons why I think this should be a web service as opposed to a CLI
tool are pretty simple:

- it is easier to make updates to a web service instead of asking
  newbies to "git pull/make"
- it doesn't force us to stick to languages/libraries that are likely to
  be present on users' systems (which generally limits us to perl5,
  python, c)
- it would be better received by newbies than a CLI tool (arguable, but
  still)

> Later "kit mail" can also run checkpatch, check SOB tag, add some kind
> of change ID or anything else we will consider necessary. It may be
> necessary to be able to force-override some of the checks, but by default
> you are now getting patches that have SOB, checkpatch-clean, etc.

I would argue that this should be a totally separate tool from what
maintainers use, *or* that there should be two different tools -- a
simplified web bridge as described above for people submitting
occasional patches and a more powerful CLI tool used by regular
developers.

> If there is an easy way to make it work with the current email-based
> process (i.e. send email on your behalf and you receive incoming emails),
> then we could do that first and give it to new developers to relief from
> setting up email client. Otherwise, we should continue developing it
> based on something like SSB (or whatever protocol we will choose).

This slots easily into the "community bridges" workflow that I have in
mind, which is why I'm leaning towards it being a web tool.

> On the protocol side I don't have strong preference for SSB or
> something similar custom. It seems that we will use SSB in somewhat
> simplified way, i.e. global connected graph, rather than several large
> groups or small isolated groups. We won't need Facebook-like following
> nor Pubs announcements. You obviously don't want to be notified of all
> messages in the system (LKML), but still it's a global graph in the
> sense that you can receive anything if you want or CC anybody.
> That limited subset of SSB should be easier to implement.
> So as Konstantin said, we could fork SSB to better fit our needs.
> The more important part will be the application-level protocol that
> we will transfer inside of SSB messages, which is mostly transport
> protocol for our needs (at least for the majority, maybe not for
> Konstantin's concerns :)).

I'm all for taking the best parts of SSB and ditching the not-so-great
parts of it (like reliance on nodejs-formatted json), but we need to be
careful not to paint ourselves into the corner doing so. There's a lot
of careful thought behind SSB, especially its decentralized nature, and
people who are developing the v2 of the protocol are well-aware of the
downsides of v1. I think we should let them complete this work before
deciding to fork it or not.

Many people asked why not just use git as the channel/protocol instead
of something esoteric like SSB, and the easy answer is that git is
poorly suited for this purpose:

- git is fine-tuned for small revisions to large static codebases; it is
  not well-suited for applications where either the number of files
  grows indefinitely as records are added, or where the contents of the
  same file get completely rewritten between revisions (as with
  public-inbox v2). It *works*, but it's obviously not built for it.
- we don't need multiple branches/tags/etc for the purpose of creating a
  chain of records; we also don't need to worry about
  merging/rebasing/etc. Using git would be like using the scissors on
  a swiss army knife -- you *can*, but only out of desperation.
- similarly, git replication protocol is too chatty for what we need
  it to do -- it was written to support reconciling between multiple
  branches, some of which may have been rebased/deleted/etc. For
  replicating a chain of immutable records, we just need to compare the
  auto-incremented value of the latest record on the chain

> I would suggest to put bug/issue tracking aside for now (it's an
> important thing, but it should be possible to add it later) and also
> "bare chatting" (which can be done over emails for now) and
> concentrate on patches just to make things simpler. Patches are
> the cornerstone of the process.

Agreed.

> So we need to define the format of the "patch for review" SSB message
> which "kit mail" will form and push.

I think we shouldn't touch SSB yet -- we can write the maintainer tool
to support multiple sources of patches:

- public-inbox repositories (most natural choice)
- web tools that offer REST APIs (patchwork/patchew/etc)
- SSB sigchains, eventually

In my mind, these would be pluggable in the same way as one can choose
pop/imap and smtp/sendmail for mutt -- the rest of the app works the
same regardless of what fetch/delivery method you have configured.

> Regarding "state machines" in the protocol (Radicle/IPFS), I think
> it's not just "sipping the blockchain cool-aid a bit too much",
> it's a wrong tool for our needs. Smart contracts are used for
> crypto-currencies where one does want to carve the rules in the
> blockchain. But we don't want and don't need this.

Right, we need a solution where humans are the final deciding factors
about what makes it into their git trees. It's interesting to consider
futuristic situations where such decisions are made by smart contracts,
but it's a path I'd rather leave for someone more bright-eyed and
optimistic.

> Another important part of the system is user identities.
> Do we go with a public/private key pair? Or we have some other realistic
> alternatives? Assuming we go with key pairs for now, "kit init"
> will generate a local key pair for you (a new developer). But a user
> should be able to evacuate/export the private key later and pass
> an existing key (to bootstrap a new machine with the same identity).

Ah, now we are getting to *interesting* bits. :) I have a separate
conversation happening on the git list where I argue that git-send-email
and git-am should natively support minisign-type signatures:

https://public-inbox.org/git/20190930153741.GA6124@chatter.i7.local/

Other than cryptographic signing, there aren't really any "realistic
alternatives" -- and I would argue that we should continue to use PGP
for git tag/commit signing, but consider simpler alternatives for
patches, such as my minisign+TOFU proposal there.

Upsides of PGP:

- established standard with good support in git tools, including web
  tools like Gitlab/Github
- smartcard support, so PGP keys belonging to important maintainers are
  better protected than just by a passphrase
- cross-certification support with other PGP keys ("key signing")
  allowing us to establish a web of trust

Upsides of minisign:

- really fast
- really tiny signatures and public keys, such that adding them to patch
  submissions doesn't balloon things out of proportions, as with PGP
  keys and signatures
- good cross-platform support (minisign is a compatible reimplementation
  of OpenBSD's signify)

> However, we will probably need another identity that is slightly
> easier to remember and type in patch CC line than 256-char hash.
> And that probably needs to be an email address (required for sending
> email notifications anyway). But I don't know how to ensure uniqueness
> of emails in this system. An alternative would be to use usernames
> (e.g. "torvalds" or "tytso") and then a user can map that to own email
> as they want. But this does not remove the requirement for uniqueness.

My suggestion is that we continue to use email addresses for now, since
that's still required for git commits. Having a "unique global identity"
is a hard problem to solve (if it's at all solvable), so we shouldn't
try to come up with a solution while brainstorming this tool.

> Two more interesting/controversial possibilities.
> If we have an email bridge, we could also have a github bridge!
> Don't get me wrong, I am not saying we need to do this now or at all.
> I am saying that if UI part is abstracted enough, then it may be
> theoretically possible to take a PR on a special dedicated github
> project, convert it to "patch for review" SSB message and inject
> into the system. Comments on the patch will be proxied back to github.
> Andrew will receive this over email bridge and review and merge,
> not even suspecting he is reviewing a github PR (w00t!).

It's basically what I described above with my "patch submission web
service" tool. :)

> Second controversial idea: the local rich GUI/patchwork is actually
> web-based _but_ it talks to a local web server (so fast and no internet
> connection required) _and_ it resembles terminal UI and has tons of
> hotkeys and terminal-like navigation (so it kinda feels like terminal).
> You start it with "kit gui" which starts a browser for you.
> The advantage of this: we build 1 UI instead of 2, so immediate 2x
> time savings. Also consistency between the UIs: you go to web, you see
> exactly the same UI that you used to work with locally (now it's just
> powered by a remote web server).

It's not that controversial -- a web-ui that runs on a local port and is
accessible via a browser is something we should totally do, simply
because it offers a much richer interface than the terminal. The main
trouble would be designing a non-horrible web UI for this purpose...
without trying to offend anyone on this list, I'd argue that nobody
present is any good at web UIs. :) So, we should enlist a group of
people who are willing to put a good amount of effort into getting it
done.

Thanks for all of your work on this! I am trying to finalize a proposal
that I can submit for review to the Proper People -- I just wish the
rest of my work would stop demanding so much attention at the moment, so
I can spend more time working on cool things like this, and less time on
putting together spreadsheets and approving travel expenses. :)

Best,
-K
