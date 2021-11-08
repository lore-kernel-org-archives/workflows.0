Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C30C433EF
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 02:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C83E3610A8
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 02:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhKHCUU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 7 Nov 2021 21:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhKHCUU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 7 Nov 2021 21:20:20 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2DAC061570
        for <workflows@vger.kernel.org>; Sun,  7 Nov 2021 18:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=bNf6J7JEK81WrPllUt4nWrFUCPFK9c69IGWq/1uIOwA=; b=DYKBI8PoZYZTYysC9qFb2XSo2Z
        WUtDzhDj1rUEvBwIE8eReAKDkJ+whnCBAuvdd5gkjWR/4CEIYhz2kLi0q38BmmrBMiF1JTTzCU2PA
        sWGQJbk0HgEELcsLE17cQHgedHhk6PmXGq5GWxg/ZU74PtAR4nLU0o08bX/DLaHBujaCCj+eUylfz
        LsLhEwaopQSIIdFwjpVB34gykBibYvMpoaLa9xAZts0V8MlJ3zWS4me73F74XEThtITyfaO+0qPYh
        +C6uaTA03T2k98wQtw8wpFfdwOhOwPcKe9Pv3+/ajMx67ck7X14zWeyDgxJWZSLU2dKehWCLfoHHs
        eZiH54mQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mjuE2-008fPG-7Y; Mon, 08 Nov 2021 02:17:34 +0000
Subject: Re: lore+lei: getting started
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <de0e373c-cd96-752c-ceea-04c7a485280a@infradead.org>
Date:   Sun, 7 Nov 2021 18:17:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/5/21 10:07 AM, Konstantin Ryabitsev wrote:
> For this reason, actual Linux development tends to happen on separate mailing
> lists dedicated to each particular subsystem. In turn, this has several
> negative side-effects:
> 
> 1. Developers working across multiple subsystems end up needing to subscribe
>     to many different mailing lists in order to stay aware of what is happening
>     in each area of the kernel.
> 
> 2. Contributors submitting patches find it increasingly difficult to know
>     where to send their work, especially if their patches touch many different
>     subsystems.

3. Users send email problem reports to LKML they are completely ignored.
     (They don't know better or they think that the big pipe must be useful for
     something or whatever....)

-- 
~Randy
