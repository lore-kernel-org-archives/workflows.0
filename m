Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC75CC433DB
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 19:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 849BD6199F
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 19:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhCVTU0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbhCVTUF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 22 Mar 2021 15:20:05 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEDEC061574
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 12:20:05 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id i9so11784042qka.2
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Q7RRvuVNavl/gwkoCMwZmRYpQT/3oqqA/DKA2GV8Lw=;
        b=bTRCp0Fu5tnZf7WgMih1mKBhgJgdd4RgZj/Nl+Pxf7YIflOd9ERjLcGWkpn99ggt8B
         loClDoBJn0+GNwZXWsLu7rWDks9FZaW856qyk+2YJBHYweTgZRFizRhhuvcvOlZweEbP
         V5lo753rKrmksaAOHvwXvO+14lJT7nA/EgDao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=8Q7RRvuVNavl/gwkoCMwZmRYpQT/3oqqA/DKA2GV8Lw=;
        b=i7FEBc4UNu6ZLcgCQc5le9He2EhJDmEUQnVVU/Pf6tTwSQWKmkxKU7SdgL+zhV8CxG
         EKmwnmn4Ln9ZaoBp25eXasHQIyX+C4LbJ1bVE0AFFK17//ml2qwBxts1GPcnmMtMKIkA
         LhuHfMf46OgENdNbfjyLWfQI1UMRDDInTFMCNhHdYolxk+yAf+tgzmMm6Z77+udQy2dF
         nwybMcVUPoEuUUp9UQXmOL/ra4YykYj9ClG25wM0YrAr/tPg71SBkfjoj3ysDxsT+nZC
         3QEVtDuiir1Pw5ItDde9Xd1hj5E8CLatJ+I7LWHjBbZJJH7Q9nrj7HwXZsw3yNIHZXJa
         t/Lw==
X-Gm-Message-State: AOAM531+Q/IWH7UBbHvCi1o8pZ5+AwIwMFH95c0CagtfUGAVzMkd5PW/
        hazjS2xWwSGGOwSUX0p7Xyrrcg==
X-Google-Smtp-Source: ABdhPJwj9SrTtbeqsFzhsM9BN2vyOE0oiCFqLRGfTVoVe/f+PdSx7Aw2LHjTovOR1jv3SmTYcm9WfA==
X-Received: by 2002:a37:9d57:: with SMTP id g84mr1540801qke.71.1616440804306;
        Mon, 22 Mar 2021 12:20:04 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id h16sm9632950qto.45.2021.03.22.12.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:20:02 -0700 (PDT)
Date:   Mon, 22 Mar 2021 15:20:00 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Eric Wong <e@80x24.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit-discuss@lists.linuxfoundation.org,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: create mailing list "linux-issues" focussed on issues/bugs
 and regressions
Message-ID: <20210322192000.7ea4dfslebcfok4l@chatter.i7.local>
Mail-Followup-To: Thorsten Leemhuis <linux@leemhuis.info>,
        Eric Wong <e@80x24.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit-discuss@lists.linuxfoundation.org,
        Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
 <20210322171636.fkep2lby6gnve4su@chatter.i7.local>
 <e93ad98a34828a4140fa59c1fb5b01f03c6f4245.camel@HansenPartnership.com>
 <20210322183427.GA1195@dcvr>
 <09a6256e-0015-d360-9347-f025a7d5adfd@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09a6256e-0015-d360-9347-f025a7d5adfd@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Mar 22, 2021 at 07:55:29PM +0100, Thorsten Leemhuis wrote:
> Out of curiosity: will that work for other bug trackers as well? Like
> the gitlab instance used by the drm developers? It's not really
> important and I guess the answer will be "no", but the question came up
> while at it...

If there's an API to poll changes, then it can be easily turned into a
public-inbox "feed" -- same as I intend to do for bugzilla. Each entry simply
gets converted into an RFC2822 message and stored in the repository that can
be indexed and queried by public-inbox alongside any other source.

-K
