Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23786ECE596
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 21:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04F14206C0
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 21:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbfJGVvE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 17:51:04 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:48227 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728422AbfJGVvE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 17:51:04 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com [104.133.0.98] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x97Lnx62021874
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 7 Oct 2019 17:50:03 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 2099C42045A; Mon,  7 Oct 2019 17:49:59 -0400 (EDT)
Date:   Mon, 7 Oct 2019 17:49:59 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     David Miller <davem@davemloft.net>
Cc:     sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191007214959.GB6104@mit.edu>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007.173329.2182256975398971437.davem@davemloft.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 07, 2019 at 05:33:29PM +0200, David Miller wrote:
> From: "Drew DeVault" <sir@cmpwn.com>
> Date: Tue, 24 Sep 2019 14:37:28 -0400
> 
> > Until this part. Phasing out email in favor of a centralized
> > solution like Gitlab would be a stark regression.
> 
> I have to make a statement about this because it's really the elephant
> in the room.
> 
> Email is on the slow and steady decline to an almost certain death.

It might be useful to consider why people have been saying, "you can
take e-mail away when you pry my MUA from my old, dead, fingers".  In
other words, why do people want to keep e-mail based process?

Here are some potential reasons:

* People like having a variety of clients, which they can customize
   * To provide off-line access
   * Advanced filtering and indexing options
   * Ability to create pipelines so the contents can be easily piped
     to scripts (e.g., checkpatch, git am, etc.)
* Support for handling large number of e-mails (at least some clients / backends)
* The same system is used to discuss concepts as well as patches
* Easy for people to subscribe to patches, reviews, and discussions for a particular
  subsystem

> And when we have these conversations about how important it is to
> retain email based workflows, is that really to make sure we have a
> backup plan in case new infrastructure fails, or is it to appease
> "senior" maintainers like myself and others who simply don't want to
> change and move on?

The reality is we do need to be compatible with e-mail based workflows
for a transition period that will almost certainly last at least a
year.  Part of this is because the initial version will almost
certainly not have 100% of all of the necessary features, but rather
will be a "minimum viable product" which can then be iterated on to
add additional functionality to support additional workflows.  The
other reason is that people will need time to transition at their own
pace.

Nevertheless, it is important that the design try to subsume all
e-mail based workflows, since in the absence of some mangerial dictat
forcing everyone to switch, this new solution needs to be strictly
superior to e-mail, which means it has to support all of the reasons
why people are so wedded to e-mail today.

					- Ted
