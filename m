Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FC9C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3825C613F5
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbhFQPvn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbhFQPvn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:51:43 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F95DC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gyGfysciebALl4wWHx1TMTVdXKHoGRXk3i2M6ii0Rk4=; b=YX9ZL3PiK8e/7vmAYJGGWDLUrn
        yNWkKpB81TN5hdrVKuFBFBq9v92VivRzU5UxOYchOz5CLc1L7zVijoPs/cmzb1j3vuKjIC3cXfrbm
        3OYiF8mAf+XkDfyoCfWhy6+0M/MyPkZLoZytBuzkhA6dHBw9NxXqg5yM3Qm5cXXb5lCcSHLmAUd0F
        8gltFqfY6cuHSsn5XUf01WYZEFpSAEWejhh4gE7vtqzQ0kgbZF0uVwzafOHOQOR9dLrkzY0nGatf+
        vKQTDPp9moHgKMVUjxrDf0fXCIlN5EfaPl7rHnPaIXFiXQiSk7yD+GpSIaeEoNuf5BvgF01hJuWnB
        kE3JnJXg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltuGJ-009Iav-Qy; Thu, 17 Jun 2021 15:49:04 +0000
Date:   Thu, 17 Jun 2021 16:48:59 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMtu66NhcXLUMmVC@infradead.org>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617144741.jxachwj46ftzlgns@nitro.local>
 <20210617112556.41fe8200@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617112556.41fe8200@gandalf.local.home>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 11:25:56AM -0400, Steven Rostedt wrote:
> Let me see if I understand the proposed work flow, and perhaps add some
> myself.
> 
> 1) Someone clones Linus's tree or some subsystem tree into their github
>    account.
> 
> 2) Does some work.
> 
> 3) Pushes it to their account on github.
> 
> 4) Runs git pull-request that will go to pulls@lists.kernel.dev
> 
> 5) Then this bot can pull the request into a kernel.org tree.
> 
> 6) Runs checkpatch on each commit.
> 
>    On errors, sends a report to the submitter, and stops here.
> 
> 7) Could have the zero-day-bot run against it.
> 
>    On errors, send it back to the submitter.
> 
> 8) If it passes all the above, it then gets broken into a patch series and
>    then sent out to the mailing lists and Cc's maintainers based on the
>    get_maintainers list. Probably should be filtered a bit.
> 
> Is this what is being proposed?

Minus checkpatch.pl which actively causes harm these days this would be
incredibly useful.  I'm all for this while I'm totally opposed to
plugging into the fashionable SAAS desaster of the day.
