Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5232C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 10:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2421613ED
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 10:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhFQKM0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 06:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhFQKMZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 06:12:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB4FC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=nmeHZRMOmoqft367b+rZxjxVHj/lMKz6x1+FrExRw/E=; b=Irir+8+dFKxBLDbv+n58p+moaV
        9sEDID+hChmRgXyGb+asmPyWz5CbXCnyJ72lZZYnpZyLiNDsKMGTA6t+wsA/a1ZKJMfUYhjOcjOGI
        XeVk3uNzkIWvFt09hh2wQpuheBFizCMr8aCACqz+dVhWYtj/nEDJNW07Znrg7dH4q/sg2v9WXVDwx
        OvlH1jWg36ZdfxN93RhgyR00ER5xgOVQs/6ZOQ0Aay8yWGX80MtCak8KlEHM1qke6KNWU3FRnrny4
        FXAwQN/lpFOxHWzKnSvWoDQcmJZ73lfKPQs/3CRpl4q8noX7BJfuCPy8ubXWv/+/XLFNP/EJZfHsC
        MpVcGXbQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltoxq-0090AU-62; Thu, 17 Jun 2021 10:09:37 +0000
Date:   Thu, 17 Jun 2021 11:09:34 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMsfXuykH6z0ZbpM@infradead.org>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
 <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 11:52:04AM +0200, Dmitry Vyukov wrote:
> You don't want to accept these contributions even if you won't be able
> to tell the difference on your end? But why? This looks really
> orthogonal to a person's expertise and proficiency in software
> development. Whether that's inability to deal with email, or no desire
> to spend time on that, or just personal preferences.

Because I don't waste my time on the kind of crap that comes from
github.  If you build a separate webinterface that allows anyone to send
a proper series from a git tree that is all fine.  But github is toxic.
