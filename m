Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714B6C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4079620B7C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfJJU70 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 16:59:26 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:39579 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726733AbfJJU70 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 16:59:26 -0400
Received: from callcc.thunk.org (guestnat-104-132-34-105.corp.google.com [104.132.34.105] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9AKvYsn027358
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Oct 2019 16:57:34 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id CF5DC42045A; Thu, 10 Oct 2019 16:57:33 -0400 (EDT)
Date:   Thu, 10 Oct 2019 16:57:33 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191010205733.GA16225@mit.edu>
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 07:52:50PM +0200, Dmitry Vyukov wrote:
> I know you all love Gerrit but just to clarify :)
> Gerrit stores all metadata in a git repo, all users can have a replica
> and you can always have, say, a "backup" replica on a side done
> automatically. Patches and versions of the patches are committed into
> git into special branches (e.g. change/XXX/version/YYY), comments and
> metadata are in a pretty straightforward json (this is comment text
> for line X, etc) also committed into git, so one can always read that
> in and transform into any other format. And you can also run Gerrit
> locally over your replica.

Konstantin has spoken about some his concerns about git's scalability,
and it's important to remember that just because Gerrit has shown to
work well on some very large repositories, it doesn't necessarily mean
that it will work well on git repositories using the open source C
implementation of git.

That's because Gerrit as used by Google (and made available in various
public-facing Gerrit servers) uses a Git-on-Borg implementation[1],
where the storage is done using Google's internal storage
infrastructure.  This is implemented on top of Jgit (which is git
implemented in Java)[2].

[1] https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/xM9THFr55L8
[2] https://groups.google.com/a/chromium.org/d/msg/blink-dev/GZOeMUPE7Bc/LmxSj_ezcQ8J

That doesn't necessarily mean that git can't be made to work well
enough as a transport layer.  I'm just pointing out this may be the
explanation for why some say, "See, Gerrit works really well on
super-large repos storing huge numbers of review comments" and others
are saying, "it would be really scary to run git as a transport layer
on kernel.org servers because git won't scale well to that kind of
load."

Both may be correct.

Cheers,

					- Ted
