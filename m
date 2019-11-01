Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29972CA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 20:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D08DC217D9
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572638882;
	bh=SeY0guwPS+Hxxs4xB1vAyzVJ8SjaI9P5KLw3p1HVdLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AjrIR+WWc6YELk1hAriU4UX2X39UleF+h1IpgosmUNpzOm8g76fs7E0kQxnyhpTFp
	 kfjFCHSeInGJ0qJONRrzQgoHb4vELxrTU0JVm+cs3ArSB413eei3/Ft0eiilnsMgKJ
	 CIPEzU5nfgu5unh3lYw/wMWEPsH1mtsCItfZ3UTY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfKAUIB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 16:08:01 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:40805 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfKAUIB (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 16:08:01 -0400
Received: by mail-qt1-f178.google.com with SMTP id o49so14519302qta.7
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2019 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+QGnMyDrLoyAY+QvzU0okF63rpsh9xhfmokN6tULrbk=;
        b=dyDkUxWvROg+V2rdD2NlQuL1Pq1k5cvgS5F7AzX0w0ceT0mqYLVr+t0ejb16R9D5R6
         w2c8KYnyYqpLSseD8D5hHoFYBRVPiyaYm2+ZEQck6Pic/KEmA3BVaFd6ZFkdjSkIY1Zf
         oMEVN/isPySYUt8sClvn8TAmQaAiNsEAfvPgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=+QGnMyDrLoyAY+QvzU0okF63rpsh9xhfmokN6tULrbk=;
        b=m2a3ES+Zk6og/eudSzaB/ejeFV/mXHfHG//fMnE+AfCiqSmPVltRf+SGjTdCBbeXWQ
         9JaK+v2hcRTcJGeZx5ygxu3OgLD3o7+UdVTmBj/IyLpn9Nz53UNfVSkmS7HTq5+kof4W
         2yWOgAGrBA6sR/GSMYvbtC3V1OQ1nDcw5Vaq5QKRwXoWPJ0CJ2M6PMl+FqjgpYCpmljo
         TP1Lk0Pi1epF58LYentylAcFgIREPHsKnog2JS8PaIJG+DSayFUjsagTjp52SIlQNSCW
         afPfMOdL2AwhdGFfP6k2B2xurZC6gjAFYEYS1dcS+HrpLkEIB/eKXBVCvHb5SehOBCVI
         J1dg==
X-Gm-Message-State: APjAAAUb2jNZTbRrxNjvhJS4RdqcpwRDuSF2qr/0QhWySDLNhUkUTtNL
        8WwR+UxqFTM7IOV7ekfA8T/M5A==
X-Google-Smtp-Source: APXvYqxKwclc8v2NdXOMp96vuhYMBpowu6Xr5b3/eqs2LMkXwr7K03FcNyBbAZLn1v19/ZenagpVdw==
X-Received: by 2002:ac8:2476:: with SMTP id d51mr1253344qtd.378.1572638879144;
        Fri, 01 Nov 2019 13:07:59 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id q34sm5823632qte.50.2019.11.01.13.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 13:07:58 -0700 (PDT)
Date:   Fri, 1 Nov 2019 16:07:55 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Eric Wong <e@80x24.org>, Han-Wen Nienhuys <hanwen@google.com>,
        workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
Message-ID: <20191101200755.h7gyt63rgwyxuqbd@pure.paranoia.local>
Mail-Followup-To: Bjorn Helgaas <helgaas@kernel.org>,
        Eric Wong <e@80x24.org>, Han-Wen Nienhuys <hanwen@google.com>,
        workflows@vger.kernel.org
References: <20191029222629.GA19318@dcvr>
 <20191029231313.GA124865@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029231313.GA124865@google.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 29, 2019 at 06:13:13PM -0500, Bjorn Helgaas wrote:
> On Tue, Oct 29, 2019 at 10:26:29PM +0000, Eric Wong wrote:
> > > https://docs.google.com/document/d/1khLOBw5-HyaaNX7xregpHQLSfvGDUeHDY921bkI-_os/edit?usp=sharing
> > 
> > Thanks for taking notes.  Is there a version accessible to users
> > without JavaScript?  Thanks.

I'll try to fill in the missing details below, to the best of my
recollection.

> Consensus:
> * Current situation is suboptimal/problematic
> * CI folks
> * Patchwork streamlines workflow; lot of activity now. Dormant for years, but now improving.
> * Konstantin: patches: no attestation; no security. Easy to slip in vulns

I must highlight that some of those present didn't see this as
inherently a bad thing -- code contributions come from untrusted brains,
if you will, so the fact that submissions traverse untrusted channels
does not make these contributions any more untrustworthy. All code must
be treated as potentially dangerous -- whether because it is
intentionally malicious or just buggy -- so adding cryptographic
signatures at this stage of the code review process would offer no
meaningful improvement. In fact, it can lull maintainers into a false
sense of security where, arguably, none should be.

While I don't disagree with this, I feel that in reality the
maintainers' attention span is already overtaxed, so adding end-to-end
verifiable developer attestation will being more good than harm. Those
maintainers who consider them harmful to their process can simply choose
to ignore the whole thing.

> * Linus checks sigs, but subsystem maintainers don’t.

Rather, they can't, because there is no accepted or workable mechanism
for doing so.

> * Konstantin: proposes minisign signatures.

Specifically, "signify-compatible" signatures, not specifically
signatures made with minisign (which implements signify via libsodium).
Minisign adds some things which may not be interesting to us anyway,
since we are not signing actual files.

The main (and the most significant) downside of minisign/signify is that
it doesn't integrate with hardware crypto devices the same way gnupg
offloads key storage and operation to a TPM or a cryptocard. If we
choose to go the way of signify-compatible signatures, we are opting to
store the key locally and do key processing in the main memory. I feel
very conflicted about this -- but it's not like any significant number
of people use hardware tokens for their PGP operations right now anyway.

> * How realistic is this? (Steven).
> * How big is the key? Ed25519 are short keys.

ECC cryptography is preferred over RSA because:

- private and public keys are dramatically shorter, but offer similar
  cryptographic strength
- ECC operations are much faster
- ECC signatures are dramatically smaller

(To dispel some common misconception, ECC is *not* quantum-proof.
However, we don't currently have any reasonably usable quantum-resistant
asymmetric crypto, so it's not useful to discard ECC for this reason.
Besides, it's not like we're putting billions of dollars into ECC the
way bitcoin is.)

> * Identity tracking? PGP giving up on key signing. TOFU.

Identity management is a different and very hard problem. I'm hoping we
can benefit from the work done by did:git folks.
https://github.com/dhuseby/did-git-spec/blob/master/did-git-spec.md

> * (unhearable)
> * KR: signify/minisign background.
> * PGP
> * KR: Want it to be part of git.

Indeed, I don't want this to be some kind of external wrapper tool,
because that would assure non-adoption. Attestation needs to be done
natively by git.

> * PGP signatures are attachments. Attachments are easily stripped from message.
> * KR: want to archive history

From my perspective, the main goal of introducing attestation at the
email protocol level is for archival/legal review purposes and to remove
any remaining trust in the infrastructure. Currently, we inherently
trust the following systems not to do anything malicious: vger, lore,
patchwork. We should work to make attestation be end-to-end.

> * Complex patch doesn’t get in immediately, because patches need comment rounds, then spoofing gets exposed.

To clarify:

The argument was that attempts to sneak in malicious code while
pretending to be someone else would be quickly discovered, because any
significant code contribution requires back-and-forth and if the "From"
address is spoofed, then the real developer would quickly point out that
they are not the actual author of the code.

My counter-argument is that history proves that we can't trust humans to
recognize maliciously misspelled domains. If you receive a submission
like this:

From: Konstantin Ryabitsev <konstantin@linuxfoudnation.org>

you will need to pay very close attention to that "d" and "n" to realize
that it didn't actually come from me.

> * Greg: base tree information will be great.
> * Konstantin wants to put it into Git.

It's already in git starting with version 2.9.0 (see `man
git-format-patch` for `--base` and `BASE TREE INFORMATION` sections). I
want it to be required.

> * Base tree
>    * Discuss base commit
>    * Hanwen: SHA1 is opaque too
>    * KR: Linus complains that Changeid is equivalent to messageid, not so much opaqueness.
>    * Hanwen: suggest to add a public URL to the base tree
>    * Base goes into email; --base option git-format-patch.
>    * Must become a requirement
>    * Put into check-patch
>    * Similar to signed-off
>    * Not mandatory, andrew morton not using git. RFC patches also don’t need it.
> * Gateways:

Specifically, we were talking about adding gateways that would translate
git-native operations like push or pull-request into mailing list
submissions -- a patch or a series of patches.

>    * Point to tree, send from system
>    * Inside corporations, HTTPS.

This is the protocol most likely remaining unhindered behind corporate
firewalls.

>    * Adopt Gitgitgadget from github; creates mail patches from a GH repo.

This was my action proposal to adopt GitGitGadget for Linux Kernel
purposes. Since it already exists, it requires the least amount of
effort to get going.

>    * Command line tool

To clarify, we talked about having a wrapper around "git format-patch"
or "git request-pull" that would translate the contributor's work from a
local git tree into a properly formatted mailing list submission (and
send it off via a limited SMTP gateway offered by kernel.org). It would
require a proposal for funded work.

>    * Figuring out who to send this to.

General comment that "get_maintainer.pl" often returns too many hits.

>    * Automation defeats attestation goal.

*Some* automation would be incompatible with our goal of developer
end-to-end attestation, since the private key would need to be stored on
the system used by said automation.

>    * KR: should just build gitgitgadet for kernel.
> * How to know whom to send patch to?
>    * So much cruft in maintainers file.
> * Interaction git-format-patch and config is tricky.
> * Dmitrii Vyukov:
>    * Can have a server to do this
>    * KR: don’t want centralized infrastructure

Rather, I don't want *exclusive* centralized infrastructure. I'm fine
with running a service that anyone else can run as well that doesn't
introduce a hard dependency on a kernel.org-managed resource.

>    * Dmitrii: but gitgitgadget is the same?
> * (14:35): feeds.
>    * Human consumable information

We've gone over the idea of feeds multiple times in the past, but
specifically we're talking about public-inbox repositories that are
continuously updated via chained commits overwriting previous commit
data. These feeds contain RFC-2822 ("email") messages consisting of
headers and bodies, where the latter can contain MIME-formatted
attachments of various content-types. Generally, messages of this format
are intended for communication with humans, as opposed to with other
automated processes. The format that seems to be most commonly used for
non-human communication is JSON.

>    * Kernel.org can aggregate all the feeds, and can tell what CIs are still missing.

As opposed to emerging systems (like SSB) that have feed auto-discovery
implemented as part of the protocol, public-inbox doesn't have this
capability, so feed discovery must be managed via some side channel.

>    * CI mail has logs, but the results are transient

CI systems can send out emails to developers that contain limited
human-readable information. Frequently, these emails include links where
developers can get more information about the results, such as logs,
tracebacks, object dumps, etc. This data tends to be transient in the
sense that it will be deleted after a period of time in order to free up
space. My hope is that CI systems can provide this data as a feed
allowing archival systems (like kernel.org) to replicate the feed data,
including all pertinent information, and archive them for future
reference. My preferred way of doing this would be using a public-inbox
feed containing multiple refs:

refs/heads/master -- RFC-2822 formatted messages intended for humans
refs/heads/json -- JSON formatted data intended for other automation

Entries in master and json refs would use the same unique message-id
allowing cross-referencing.

Large binary objects can be linked using git-lfs, allowing their
retrieval and mirroring via `git lfs fetch --all` (I've not yet fully
fleshed out this idea).

>    * Kernel.org can archive all these data.
>    * Will be a lot of data, but want to start with feed.

I will admit the folly of this. :) If we're talking about CI binary
objects, then we're talking about terabytes of data monthly -- but I'd
like to try. It's only expensive when it needs to be fast and the way I
see this happening, it doesn't need to be fast, it just needs to be
retrievable.

>    * Needs a common structured format to understand what all CI systems have done.
>    * Attestation

Git commits can be signed, so this gives us builtin attestation.

>    * Steven: could record the acks/reviewed-by.

We were talking about developer feeds that are basically public-inbox
repositories of the developer's sent mail. I will talk about these
separately in the near future.

> * 2nd part of discussion: tooling.
>    * Lore 200 Gb.

Most of the disk space on lore.kernel.org is taken up by Xapian
databases. The git repositories themselves -- of all lists currently
archived on lore.kernel.org -- are just over 20GB.

> * [lost a lot of conversation here]
> * Patchwork:
>    * Has a web interface
>    * Can run locally.
>    * Inbox vs patchwork
>    * Patchwork with approvals from different maintainers.
>    * ...
>    * KR: write local command to work with patchwork.

See my email about "local patchwork" to get more clarity around this.

> * KR: daniel uses gitlab, some people want to use gerrit

Minor correction -- I thought the DRM subsystem already uses Gitlab for
their work, but they aren't. Gitlab is used for a lot of other graphics
subsystem work, but the actual kernel DRM subsystem is not using it yet.

>    * KR: wants to have a feed of data.
>    * Mail from gerrit/gitlab, usually is noisy.

My proposal is to have "forge liberation bots" that record and expose
all public activity happening inside forges like Gitlab, Github, Gerrit,
etc. While many of these offer a way to send email activity
notifications to mailing lists, such notifications are formatted in a
forge-specific way, don't cover all aspects of forge activity, and are
frequently a source of annoyance to mailing list subscribers who don't
care to see various "so-and-so added themselves to the CC on this issue"
messages.

Many of these forges offer a way to subscribe bots to the project's
event streams, so my proposal is to write forge-specific bots that would
connect to these event streams and record all pertinent information into
public-inbox feeds that can be mirrored and distributed. Developers can
then choose to subscribe to these feeds in the same way they can
subscribe to mailing list or developer feeds, plus they can be indexed
and made searchable via sites like lore.kernel.org.

Initially, these bots would be "read-only", but if we are successful in
keeping these feeds/bots useful (and stable), we can then offer
read-write integration so that developers can participate in forge
activities without needing to register an account on the forge or log
into the web interface. Functionality like this would be impossible
without working end-to-end developer attestation and feed discovery, so
anything like this is far, far in the mysterious future and requires a
lot of effort, perseverance, and luck before we get there.

>    * Tool can consume that feed.
>    * Libc mailing list, still struggling

To clarify -- the comment from one of the attendees was that the glibc
project is experimenting with using an email-based workflow that
backends into a gerrit instance. The web interface of the instance is
read-only and all activity must be performed via email.

> * Hanwen: Funding for tooling? Does Linux Foundation build the bridges, or do tool owners (gerrit, gitlab) have to do it?
>    * Linux Foundation can go to companies to ask for funding
>    * KR trying to get consensus so we can ask for resources & funding as a group.

It's my hope that I can get enough consensus from the developer
community that would allow me to put forth a proposal that is backed by
"all the important people in Linux" and get it funded via channels
available to the Linux Foundation. Linux Foundation itself does not have
operating funds for efforts like this, but it is able to work with its
member companies and other interested parties to solicit funding,
provided a clear goal and clear majority community support behind the
initiative.

>    * Let people use tools, sourcehut, gitlab, gerrit

If we are successful in building the "forge liberation bots," then we
make it possible for subsystems to choose their own preferred tools
without the fear that it will sequester that development effort inside a
walled garden.

If we are then able to teach these bots to bridge between forges, then
we'll find ourselves in the distributed development nirvana that I
described in my "patches carved into developer sigchains" blog post. :)

> * KR: Lore.kernel.org:
>    * Want to be able to search all over all data, gerrit, kernel etc. (like code search)
>    * Find all the patches that touch XYZ

Current limitation of lore.kernel.org is that the search is per-list --
you need to know where to look for data before you can find it. If we
start aggregating feeds from multiple sources (mailing lists, forges,
CI systems, individual developers), then we need a search box that works
across all of these feeds and presents the data in a useful format. This
is work that I hope we can fund.

> * Devs can miss reviews because people don’t know where reviews happen.
>    * KR: have a bot that will respond on behalf if maintainer has no gerrit account.

See "far, far in the future, if we are lucky" bit above.

>    * KR: long time initiative: want to move to SSB.

Rather, replace the smtp communication fabric with something else that
doesn't suffer from all the horrible downsides of using a protocol that
has been corrupted by MUAs, corporate mail servers, etc.

Eventually. If it makes sense.

-K
