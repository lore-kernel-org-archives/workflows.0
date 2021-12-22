Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4266C433F5
	for <workflows@archiver.kernel.org>; Wed, 22 Dec 2021 21:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhLVVcv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 22 Dec 2021 16:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234004AbhLVVcv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 22 Dec 2021 16:32:51 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65BCC061574
        for <workflows@vger.kernel.org>; Wed, 22 Dec 2021 13:32:50 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id fo11so3498343qvb.4
        for <workflows@vger.kernel.org>; Wed, 22 Dec 2021 13:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3A4xRbu0zKjLGpQBy3lYvCh1598yhvdE9ji95TJiTcg=;
        b=MrZ4U1a87OX6nticEF0wBBm7sX2UHsr1bnj7nNtdm2rAdpNF6LfQWuI/NtKp1uFJDh
         W1o16iSkLbv/jVnTYmBe+uPcxBIwm7PAGHAXtYv4KHSKw7WSkui9ens6uMQFTl51rvgg
         hgynSyd6VcjyNpGI4586QBFtb+VbBNKLzBFso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3A4xRbu0zKjLGpQBy3lYvCh1598yhvdE9ji95TJiTcg=;
        b=Bs8+rs5hCOCjgzwS5BOCldTKjab8Xre0b7mGQD5fjPb1otPFDrw9++O3yP9g+jO5V7
         h13hlbzQSHOQ7sPkXjColtZ+yW0Eb7tWiT1RFgDp/qv+eMqQMI5MrEIgFplPmhfpesJo
         7VVXjJp1UGjr2suG8yWQx1AevVm+ssD9UzN4bHP5b0i0Ryt0Y0q3zZygMEmFxAyuoQaG
         GPaUMmhico3OGA1KHbrr7PWS3n1viOyinV8kiWk/DC3WkHwu3CBM0iY15CBRvJBZG0CG
         ph1kNQIAeuYAE/CvR5XwU+MZYd375UdsAwD6Hjn6e4l0c5o6eG4sD92p+I9uIlV9y9Kx
         vO/w==
X-Gm-Message-State: AOAM531h7s2YCNfqjXD+R0xwsYtmm3o/OamrkHDgKv25qX5TNgr14Xco
        PXA5ydN17BPgl6OfsxuJRuQ3Qw==
X-Google-Smtp-Source: ABdhPJyLB77C/LaOENOuHIKRMwUq7JNKySaSFKj4x+riDB0EXVEqUw70B0frpV2sL+5DN8yVIATnig==
X-Received: by 2002:ad4:5ccb:: with SMTP id iu11mr145668qvb.56.1640208769937;
        Wed, 22 Dec 2021 13:32:49 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id f9sm2688084qkp.94.2021.12.22.13.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:32:49 -0800 (PST)
Date:   Wed, 22 Dec 2021 16:32:47 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Junio C Hamano <gitster@pobox.com>
Cc:     =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>,
        Emily Shaffer <emilyshaffer@google.com>, git@vger.kernel.org,
        jrnieder@gmail.com, jonathantanmy@google.com, steadmon@google.com,
        chooglen@google.com, calvinwan@google.com,
        workflows@vger.kernel.org
Subject: Re: Review process improvements
Message-ID: <20211222213247.5dnj3zlj53lh6l32@meerkat.local>
References: <YbvBvch8JcHED+A9@google.com>
 <20211217183942.npvkb3ajnx6p5cbp@meerkat.local>
 <211222.86ee65pb60.gmgdl@evledraar.gmail.com>
 <20211222154534.b2gb22ghn2mpyeur@meerkat.local>
 <xmqqh7b0juk5.fsf@gitster.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xmqqh7b0juk5.fsf@gitster.g>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Dec 22, 2021 at 11:42:02AM -0800, Junio C Hamano wrote:
> > This would require pretending that we're authorized to send mail from the
> > domain name of the commit author, so this unfortunately won't work (and hence
> > the reason why GGG does it this way). E.g. say you have:
> >
> > From: foo@redhat.com
> > Subject: [PATCH] Fix foo
> 
> Would it help to use "Sender:"?  When GGG or any other automation
> are trying to send e-mail on behalf of the person shown on "From:",
> I thought that it is the mechanism for them to use to identify
> themselves.

Indeed, that's how the DKIM standard wanted to deal with this problem, however
when the DMARC RFC was being drafted, this approach was deemed insufficient.
They have a good explanation for it -- there is no standard among UI clients
to handle the Sender/From discrepancy. Most MUAs will happily ignore the
Sender: field and will only show what is in From:, so this approach was
considered ineffective against phishing attacks. An attacker could easily
register a domain, set DKIM records, and then use any From: they wanted as
long as they used a valid Sender: header, knowing that it would be ignored by
most mail clients.

So, DMARC deliberately ignores the Sender: header and *only* pays attention to
the From: field for its purpose.

-K
