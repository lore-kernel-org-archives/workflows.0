Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C9DEC8743
	for <workflows@archiver.kernel.org>; Thu,  7 Sep 2023 17:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237025AbjIGRlc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbjIGRlb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Sep 2023 13:41:31 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A341BFF;
        Thu,  7 Sep 2023 10:41:03 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B4809734;
        Thu,  7 Sep 2023 13:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4809734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1694093155; bh=d9VOO54izSZ+Y78YkdpBL5lYFwvi3J0YPmSbTDRc0eY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Xm/uediu6OX8jnr8w4hh5TE7FmCIxkMu67/6S66YIMy1GfUvUNbHNRkEnsbDX6cR/
         3zpgdDOrJ62wEfigCqXNOixua9mFty5+Op5vXAilCJc3OQmYAVf3ERTvpCPC0trLir
         KUcF7kFeuJ0dfkS5jZmYlVuXmQO+NRpKud4jCWFCqUvmoa1zy9jT25jSitjTr47dd+
         La7+jZ4OV5mJT/xoN3mSgbT8YvgNYyIl0VDaZpr9IxCvl//vvXd+AHY8MvHLRGRCq2
         GaQjeSwup6NZ89DKjNYLY5eemozJdTdTHFEqcBwZ29lHI5qKwnGEbM32vBi54iVYw1
         mcl7YYnXMC52A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jesper.juhl@gmail.com
Subject: Re: [PATCH] Documentation: Process: Add a note about git way of
 applying patch
In-Reply-To: <ZPnJDTcKb5Wf30Zl@Gentoo>
References: <20230907115420.28642-1-unixbhaskar@gmail.com>
 <87bkee40ac.fsf@meer.lwn.net> <ZPnJDTcKb5Wf30Zl@Gentoo>
Date:   Thu, 07 Sep 2023 07:25:54 -0600
Message-ID: <8734zq3yjh.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> On 06:48 Thu 07 Sep 2023, Jonathan Corbet wrote:
>>Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:
>>
>>> cc: jesper.juhl@gmail.com
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  Documentation/process/applying-patches.rst | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
>>> index c269f5e1a0a3..201b9900bffe 100644
>>> --- a/Documentation/process/applying-patches.rst
>>> +++ b/Documentation/process/applying-patches.rst
>>> @@ -6,6 +6,13 @@ Applying Patches To The Linux Kernel
>>>  Original by:
>>>  	Jesper Juhl, August 2005
>>>
>>> +
>>> +.. applying patch by Git::
>>> +
>>> +    You can use the below syntax to patch in git repository
>>> +    git-apply --whitespace=error-all <patchfile>
>>> +
>>> +
>>>  .. note::
>>>
>>>     This document is obsolete.  In most cases, rather than using ``patch``
>>
>>So why are you sending a patch ... with no changelog
>
> My bad. Realized it once send it.
>
>
>>to a document that is explicitly marked as being obsolete?
>
> I thought if people visit that page , that note might help.
>
> Are we taking out that page from the doc? Why that page is still there?

I would happily remove it, but ran into resistance (a few years ago)
when I suggested it.

Thanks,

jon
