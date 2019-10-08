Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF96ECE58C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 01:17:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B014920835
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 01:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfJHBRG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 21:17:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729212AbfJHBRG (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 21:17:06 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63F2721479;
        Tue,  8 Oct 2019 01:17:05 +0000 (UTC)
Date:   Mon, 7 Oct 2019 21:17:04 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191007211704.6b555bb1@oasis.local.home>
In-Reply-To: <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20191007.173329.2182256975398971437.davem@davemloft.net>
        <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 08 Oct 2019 10:00:03 +1100
Daniel Axtens <dja@axtens.net> wrote:

> Non-email systems have an easier time of this: with gerrit (which I'm
> not a big fan of, but just take it as an example) you push things up to
> a git repository, and it requires a change-id. So you can track the base
> tree, dependencies, and patch revisions easily, because you build on a
> richer, more structured data source.

I believe we all want a new system that can handle this, but still be
able to work with email. Patchwork requires to read all emails and
figure out what to do with it. This workflow doesn't need to do that.
But it should be able to send out emails on comments, and a reply to
one of those should easily be put back into the system.

As for adding patches, we can push to a git tree or something that the
tool could read. It's much easier to know what to do with a branch then
email. A rebase could be a new version of the series (and we should
probably archive the original version).

-- Steve
