Return-Path: <SRS0=p3fK=XS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E3DC32755
	for <workflows@archiver.kernel.org>; Mon, 23 Sep 2019 12:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85E9420835
	for <workflows@archiver.kernel.org>; Mon, 23 Sep 2019 12:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439592AbfIWMwN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 23 Sep 2019 08:52:13 -0400
Received: from www62.your-server.de ([213.133.104.62]:36926 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439591AbfIWMwN (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 23 Sep 2019 08:52:13 -0400
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1iCNox-0008TH-Hx; Mon, 23 Sep 2019 14:52:03 +0200
Received: from [178.197.248.15] (helo=pc-63.home)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1iCNox-000XQr-6p; Mon, 23 Sep 2019 14:52:03 +0200
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] Reflections on kernel
 development processes
To:     Dmitry Vyukov <dvyukov@gmail.com>, konstantin@linuxfoundation.org
Cc:     ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <610c62f2-f2e4-2eb1-3051-53c573194f52@iogearbox.net>
Date:   Mon, 23 Sep 2019 14:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25581/Mon Sep 23 10:20:21 2019)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 9/22/19 2:02 PM, Dmitry Vyukov wrote:
[...]
> Also adding people from the "Kernel development collaboration platform
> wish list" discussion on the workflows list [1].
> (Rafael et al, thanks for collecting the requirements, that's very useful!)
> 
> I second the idea expressed by several people that addressing the
> contributor side is a very important part of this effort.
> 
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
> 
>  From UI perspective I think we should start with a CL interface because
> (1) it's the simplest to build (we don't invest too much into it,
> don't shift focus and will shake down more important things faster),
> (2) there are some important actions that are best done with CL
> anyway (e.g. mailing a patch). Later it may serve as an
> entry point for starting the richer terminal GUI or other types of GUIs.

+1, agree.

> There are 3 groups of people we should be looking at:
> - contributors (important special case: sending first patch)
> - maintainers
> - reviewers
> 
> I would set the first milestone as having the CL utility (let's call
> it "kit"*) which can do:
> 
> $ kit init
> # Does some necessary one-time initialization, executed from the
> # kernel git checkout.
> 
> $ kit mail
> # Sends the top commit in the current branch for review.
> 
> So that would be the workflow for sending your first kernel patch.
> 
> Later "kit mail" can also run checkpatch, check SOB tag, add some kind
> of change ID or anything else we will consider necessary. It may be
> necessary to be able to force-override some of the checks, but by default
> you are now getting patches that have SOB, checkpatch-clean, etc.
> 
> If there is an easy way to make it work with the current email-based
> process (i.e. send email on your behalf and you receive incoming emails),
> then we could do that first and give it to new developers to relief from
> setting up email client. Otherwise, we should continue developing it
> based on something like SSB (or whatever protocol we will choose).
> 
> Obviously, the intention is that if you do "kit mail" second time
> with a changed patch, it sends "V2". Or if you have multiple local
> commits it will properly mail the series (or V2 of the series).
> 
> Most (all) of the "kit" functionality should be separated from the UI
> and be available for scripting/automation/other UIs. Whether it's
> done as "libgit" or as "shell out" is discussable.
[...]
On that note, such a tool would also need to co-exist with the current
email based process for some (long?) time in order to allow a smooth
transition period. Last week I spent a few of nights hacking a small tool
which is regularly pulling the lore git trees I'm interested in and checking
out all [new] mails into maildir format so they can be read naturally by
UIs like mutt et al [0]. As an experiment, in case of bpf vger mailing list,
it extracts all current ~8k mails in under a second:

$ ./l2md
general.maildir = /home/foo/.l2md/maildir/common
general.period = 30
repos.bpf.maildir = /home/foo/.l2md/maildir/bpf
repos.bpf.initial_import = 0
repos.bpf.url = https://lore.kernel.org/bpf/0
repos.bpf.oid_maildir = [unknown]
Initial repository check.
Cloning: https://lore.kernel.org/bpf/0
Remote: Counting objects: 23859, done.
Remote: Compressing objects: 100% (14476/14476), done.
Remote: Total 23859 (delta 1561), reused 22125 (delta 1430)
Initial repository check completed.
Bootstrap done.
Resyncing maildirs.
Processed 7953 new mails for https://lore.kernel.org/bpf/0 in 0.586466s.
Sync done. Sleeping 30s.
Resyncing repositories.
Fetching: https://lore.kernel.org/bpf/0
Merging: refs/heads/master commit d608393d011aa0c0fc5983059052362cebeafc91
Resyncing maildirs.
Processed 0 new mails for https://lore.kernel.org/bpf/0 in 0.53611s.
[...]

I've started using it daily now and it appears to work nicely so far.
Given that, I'm wondering whether for a "kit" tool and beyond, we could use
something like lore git trees as a basis. The 'receive' side is already
there today, but I'm wondering if it's feasible to have a sendmail compatible
interface that would allow to push new "mails" into lore git trees as well,
where a bridge from lore git to vger list then distributes the message to
all email-based subscribers. Obviously this needs similar spam-filtering and
sanity checks as with vger lists, but eventually it wouldn't be any different
than anyone being able to send to vger via email. The nice thing would be
that the trees are mirrored on a wide basis already (and wouldn't need any
additional transport) and CI infrastructure can just pull them, work with
git sha ids, and reply with the results by pushing (implicitly by mentioned
sendmail compat tool, or "kit" etc). "kit" tool for contributors/reviewers
(I'd probably put both into the same bucket on a high level) and maintainers
could be built around the trees as foundation which could already solve the
issues around mail pointed out by Konstantin some time ago [1] while allowing
max compatibility to current workflows as a transition period. Just a thought.

Cheers,
Daniel

   [0] https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git/
   [1] https://people.kernel.org/monsieuricon/patches-carved-into-developer-sigchains
