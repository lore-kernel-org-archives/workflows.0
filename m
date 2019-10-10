Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62931C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 261FB21D7A
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfJJUng (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 16:43:36 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:36558 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfJJUng (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 16:43:36 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 702471F4C0;
        Thu, 10 Oct 2019 20:43:35 +0000 (UTC)
Date:   Thu, 10 Oct 2019 20:43:35 +0000
From:   Eric Wong <e@80x24.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Theodore Ts'o <tytso@mit.edu>,
        David Miller <davem@davemloft.net>
Subject: Re: Fwd: SSB protocol thoughts
Message-ID: <20191010204335.GB5440@dcvr>
References: <CACT4Y+Y0_2rCnt3p69V2U2_F=t4nMOmAOL-RGwxSS-ufk41NAg@mail.gmail.com>
 <CACT4Y+ZVbTk1esf9sDvDbXMCRDvFZwE1SbjxMAFbYjzK7AKoYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZVbTk1esf9sDvDbXMCRDvFZwE1SbjxMAFbYjzK7AKoYA@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dmitry Vyukov <dvyukov@google.com> wrote:
> Hi,
> 
> I've spent some time reading about SSB protocol, wrote a toy prototype
> and played with it. I've tried to do a binary protocol and simpler
> connection auth/encryption scheme. Here are some thoughts on the
> protocol, how we can adopt it and associated problems. Some of the
> problems we don't need to solve right now, but resolving others seem
> to be required to get anything working. I am probably also
> overthinking some aspects, I will appreciate if you can stop me from
> doing this :)

<snip>

> 4. DoS protection.
> Taking into account this completely distributed and p2p nature of
> everything, it becomes very easy to DoS the system with new users (one
> just needs to generate a key pair), with lots of messages from a
> single user, or both. And then these messages will be synced to
> everybody. Eventually we will need some protection from DoS. Not that
> it's not a problem for email, but it's harder to create trusted email
> accounts and email servers have some DoS/spam protections. If we move
> from email, it will become our responsibility.

Right, every p2p or federated messaging system will have the
same problems email has with spam, flooding and/or eventual
centralization if it becomes popular.

There can't be a forced migration on anybody.  Using git isn't
even a requirement for kernel development, after all.

Instead of introducing a new system with the same problems as
the old one, I still believe we can improve on the old one...

> 5. Corrupted feeds.
> Some feeds may become corrupted (intentionally or not). Intentionally
> it's actually trivial to do -- if you are at message sequence 10, you
> push 2 different but correctly signed message sequence 11 into
> different parts of the p2p system. Then there is no way the whole
> system will agree and recover on its own from this. Different parts
> will continue pushing to each other message 11 and 11', concluding
> that the other one is invalid and rejecting it.
> Konstantin also mentioned the possibility of injecting some illegal
> content into the system, and then it will become "poisoned".
> The system needs to continue functioning in the presence of corrupted feeds.
> A potential solution: periodically scan major pubs, detect
> inconsistencies and corrupted feeds and publish list of such feeds.
> E.g. "feed X is bad after message 42: drop all messages after that,
> don't accept new and don't spread them". This may also help recovering
> after a potential DoS.
> However this may have implications on application-level. Consider you
> reply to a comment X on a patch review, and later message with comment
> X is dropped from the system.

Yup.

> If we get to this point, then it seems to me we already have an email
> replacement that is easier to setup, does not depend on any
> centralized providers, properly authenticated and with strong user
> identities.

I'm not sure we can get past points 4., 5. or 8. and 14., easily

> Some additional points related to the transport layer:
> 
> 6. I would consider compressing everything on the wire and on disk
> with gzip/brotli.
> I don't see any mention of compression in SSB layers, but it looks
> very reasonable to me. Why not? At least something like brotli level 3
> sounds like a pure win, we will have lots of text.

Not sure about brotli, aside from the fact that it's less
popular and available than zlib, adding to installation
overhead.

Does SSB hold persistent connections?

Per-connection zlib contexts has a huge memory overhead.

I got around it for NNTP COMPRESS by sharing the zlib context,
saving a lot of RAM (at the cost of less-efficient compression):
  https://public-inbox.org/meta/20190705225339.5698-5-e@80x24.org/#Z30lib:PublicInbox:NNTPdeflate.pm

<snip>

> 8. Somebody mentioned a possibility of partial syncs (if the total
> amount of data becomes too large, one may want to not download
> everything for a new replica).
> I hope we can postpone this problem until we actually have it.
> Hopefully it's solvable retrospectively. For now I would say:
> everybody fetches everything, in the end everybody fetches multiple
> git repos in its entirety (shallow checkouts are not too useful).

Right, this is a problem with git transports, too.

Client tools for NNTP->(Maildir|POP3) and HTTP search->mboxrd.gz
results can get around that for email so users can only download
what they want.

NNTP->POP3 would be an excellent way for kernel.org to get
around delivery problems to big mail services since
they all offer POP3 importers :)

<snip>

> 14. Consistency.
> Consider there is a bug/issue and 2 users post conflicting status
> updates concurrently. As these updates propagate through the system,
> it's hard to achieve consistent final state. At least I fail to see
> how it's possible in a reasonable manner. As a result some peers may
> permanently disagree on the status of the bug.
> May also affect patch reviews, if one user marks a patch as "abandon"
> and another sets some "active" state. Then a "local patchwork" may
> show it as open/pending for one user and closed/inactive for another.
> May be even worse for some global configuration/settings data,
> disagreement/inconsistency on these may be problematic.
> There is a related problem related to permission revocations. Consider
> a malicious pub that does not propagate a particular "permission
> revocation" message. For the rest of participants everything looks
> legit, they still sync with the pub, get other messages, etc, it's
> just as if the peer did not publish the revocation message at all. As
> the result the revocation message will not take effect arbitrary long.
> These problems seem to be semi-inherent to the fully distributed system.

Yep.  Email has this problem with lost/blocked/bounced messages, too.

> The only practical solution that I see is to ignore the problem and
> rely that everybody gets all messages eventually, messages take effect
> when you receive them and in that order, and that some inconsistencies
> are possible but we just live with that. However, it's a bit scary to
> commit to theoretical impossibility of any 100% consistent state in
> the system...
> I see another potential solution, but it's actually half-centralized
> and suffers from SPOF. When a user issues "bug update" message that is
> just a request to update state, it's not yet committed. Then there is
> a centralizer server that acknowledges all such requests and assigns
> them totally ordered sequence numbers (i.e. "I've received message X
> first, so I assign it number 1", "then I received message Y and it
> becomes number 2"). This ordering dictates the final globally
> consistent state. This scheme can be used for any other state that
> needs consistency, but it's a centralized server and SPOF, if it's
> down the requests are still in the system but they are not committed
> and don't have sequence numbers assigned.
> Obviously, all of this become infinitely simpler if we have a "forge"
> solution...
> 
> Kudos if you are still with me :)

:>

Anything about bridging with email?
