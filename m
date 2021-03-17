Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD85C433E0
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 18:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 860AF64F51
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 18:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhCQSht (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 17 Mar 2021 14:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhCQShi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 17 Mar 2021 14:37:38 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CA3C06174A
        for <workflows@vger.kernel.org>; Wed, 17 Mar 2021 11:37:38 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id s7so39921128qkg.4
        for <workflows@vger.kernel.org>; Wed, 17 Mar 2021 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=VkKOmWwxZ1OJw1XYa6VFz2P6mLVdChARw+9TUM444wc=;
        b=J8W5zW0f7ustPMLUrutCTImYdXU8dq7yPsBPAoCm2DADkyPW6eyhaT1AmFLgrkDudf
         2iywjmUeBFHbS20l1THvc1dovQHUIbG6SbLX2Ydz+iS83IClac/x0F6flq+YpsU80pBQ
         62BeSeKXDO6nNtFKQAdOswXtODFruhFCDqjyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=VkKOmWwxZ1OJw1XYa6VFz2P6mLVdChARw+9TUM444wc=;
        b=bM1fPDhVniH2FsjaeQD1e7b0pj/hFcjLHe6+Xb7U0lllVBTgJbrEzw4UMXD2oELQVt
         4SkFZJEdM6tSEQMh97wTKii8HvJ+7zfXOS9CGEcgYyh/1V1Jwie+hqHUOTr+4sDRgpUU
         9XzEDPLbgFe7zmuDBMX91wQCDFtRNen0jY8N6fnMaGDey+Z5A6ans2cIV58MoIZB94Px
         32LdNAEHnA62SrDSMkhpRhKm9MOVijnLoUkJOSAy5Ndl2quy2ZcGLknOEDfVPAffKr6g
         R3+/8/QuGjWBiigBWN6k4HXTvvzU+qWX3yhpZL3uygvLh7JO52njLf4Ywyuh5dM44gz1
         nV4Q==
X-Gm-Message-State: AOAM532iefSNMV8xaBEE6Vw9CtdRxiHDIXmRb13L1oXgwyPllAh5mzLv
        siJtgnUJa894TEyyahrsgBSOi3HI4qwlFPBkvo4=
X-Google-Smtp-Source: ABdhPJzyIncTY6V1BMh/3oqY4HwIzUqowg67DScehUnD4IqWS7Btw/Mcq9JjOsH8xpV/3xtaeRIGmw==
X-Received: by 2002:a37:9bd1:: with SMTP id d200mr609669qke.328.1616006257517;
        Wed, 17 Mar 2021 11:37:37 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id a2sm15958982qtj.76.2021.03.17.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 11:37:37 -0700 (PDT)
Date:   Wed, 17 Mar 2021 14:37:34 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20210317183734.zosq5bb44nzfsimm@chatter.i7.local>
Mail-Followup-To: Eric Wong <e@80x24.org>, workflows@vger.kernel.org,
        meta@public-inbox.org
References: <20201126194543.GA30337@dcvr>
 <20210317071116.GA8121@dcvr>
 <20210317132723.xx4klonordhsb6ve@chatter.i7.local>
 <20210317181843.GA9180@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210317181843.GA9180@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Mar 17, 2021 at 08:18:43PM +0200, Eric Wong wrote:
> > Is that intentional, or can this be tweaked to show a single result for the
> > same message-id?
> 
> Not really.  At least for the summary search results, it makes
> no sense:
> 
> 	https://public-inbox.org/meta/20210317181408.9124-1-e@80x24.org/
> 
> The underlying cause that can be seen in
> https://yhbt.net/lore/all/20210316102311.182375-1-gregkh@linuxfoundation.org/
> is the Mailman-added signature for one of the posts.

Ack, hopefully we'll get all Mailman list managers to clue in and stop
mangling subject/bodies. It's kind of required for DKIM-signed messages
anyway.

> I've been considering adding a "diff view" to more easily pick
> out differences between messages with identical Message-ID with
> subtly different content, but it could be expensive for PSGI...
> I will probably prototype it in lei, first.

I was going to suggest "show the one for which the DKIM signature is valid"
but this is even more expensive. ;)

Thanks for your help.

-K
