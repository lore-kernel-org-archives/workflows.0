Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9445DC32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 14:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D2C820815
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 14:52:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731471AbfI3Ow4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 10:52:56 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:35437 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726314AbfI3Ow4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 10:52:56 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x8UEpOf3013164
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Sep 2019 10:51:27 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id AB54142014C; Mon, 30 Sep 2019 10:51:23 -0400 (EDT)
Date:   Mon, 30 Sep 2019 10:51:23 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Neil Horman <nhorman@tuxdriver.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190930145123.GA4001@mit.edu>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com>
 <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com>
 <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home>
 <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Sep 29, 2019 at 02:55:25PM +0200, Dmitry Vyukov wrote:
> One mismatch with kernel dev process that seem to be there for lots of
> existing solutions (gerrit, git-appraise, github, gitlab) is that they
> are centered around a single "mail" git tree (in particular,
> gerrit/git-appraise check in metainfo right into that repo). Whereas
> kernel has lots of kernels. Now if Steve is CCed on lots of changes
> what git tree should he pull before boarding a place? For some changes
> it may be unclear what tree they should go into initially, or that may
> change over time. Then, there are some additional relations with
> stable trees.

It might be worth unpacking the various ways in which a patch series
gets reviewed, and thus cc'ed, on multiple mailing lists.

(a) It's meant for a tree that has its own mailing list, but some
people cc LKML anyway, on general principles.  Since very few people
read LKML, it's kinda pointless, but people do it anyway.

(b) The patch series is meant for one tree, but it will have an impact
on other trees, so it's cc'ed as an FYI and hoping to get comments
from those other trees.  A good example of this might be changes to
fs/iomap, for which linux-xfs is its primary mailing list (and git
tree), but other trees use various bits of fs/iomap (and will be using
more, in the future), so it's cc'ed to linux-fsdevel.

(b1) The patch series impacts some function signature used by multiple
subsystems, so it actually requires changes in git multiple trees ---
but since the one or more changes needs to go upstream in atomic
commits, the patch needs to be reviewed by multiple file system
developers.  There may be some negotiation over which tree the change
should get pushed upsrteam, but _usually_ it's actually pretty clear.

(b2) The patch series adds new functionality which multiple subsystems
are interested in using and pushing upstream in the next merge window.
Since the change to enable the use of that feature is often
non-trivial, what typically happens is the enabling commits which
enable the functionality goes into one tree, with a branch pointer
which other trees will pull into their trees, and then each subsystem
will land additional commits to utilization the feature in their tree.

Usually the patch series with the enabling commits will also come with
a sample set of commits using that new functionality for one subsystem
(usually the subsystem which the primary author of that functionality
is associated with), and that's the git tree for which the initial
patchset will be sent.

(c) People who are making wide-scale cleanups to the tree (example:
adding /* FALLTHRROUGH */ tags) where it is sent as a single patch
series, but in fact very often each subsystem maintinaer will take the
commit through their own tree.  (This is often to avoid later merge
conflicts.)  The rest of the changes may then go up through some
default tree (e.g., the security tree, or the trivial tree, etc.)

It is this last case where which tree a patch sent might get sent
through is uncertain, but it's also a small percentage of the overall
patch flow.

> I suspect that kernel tooling should account for that and separate
> changes layer from exact git trees. Like mailing lists. Usually there
> is 1 mailing list and 1 git tree per subsystem, but still this
> relation is not fixed and one can always CC another mailing list, or
> retarget the change, etc.
> What do you think?

That would be nice, but I worry that if we make that a requirement for
the 1.0 version, it may make the whole system too complicated and
delay its rollout.

So what I would say is that as a Minimum Viable Product, it's
important for the author to be able to designate which git tree entire
the patch series is meant for, and also specify other mailing lists
that should be cc'ed.  That something that pretty much all of the
centralized "forge" systems (which I assume include solutions like
Gerrit as well as github) can handle today.

It would be _desirable_ if commits could be annotated with the set of
subsystem maintainers for which approval is requested.  It would also
be desirable if there was a way for a subsystem maintainer to indicate
that they will take the patch through their tree, and the right thing
should happen in terms of removing the patch from needing further
review once that patch is in some other subsystem's tree.

Also, even if we believe that it is (a) possible and (b) desirable to
have a single system which everyone is mandated to use, there will be
a long transition period where not everyone will be using the new
centralized system.  So the system *has* to handle smoothly subsystems
which haven't yet converted to using the new centralized system.

Look at git as an example; everyone uses git because it is clearly the
superior solution, and it made maintainers' lives easier.  But for a
long time, Andrew Morton's -mm patch queue was maintained outside of
git, and in fact, was accessible via ftp.  We don't have a senior vice
president which can force everyone to use the new system --- or for
example, stand down all development work for two months and force
everyone to work a single focus area, like reliability or security (as
Microsoft did a few years ago).

Can we focus most development resources on a single solution which
appears to meet the vast majority of everyone's workflow?  Perhaps,
especially if we can get corporate funding of the solution which we
expect to meet most developer's needs.  But can we force everyone to
use it?  No, and the attempt to force everyone to use it may actually
make wide adoption harder, not easier.

				- Ted
