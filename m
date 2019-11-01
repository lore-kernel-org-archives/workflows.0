Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9424CA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 13:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F647217D9
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572613656;
	bh=VzG+ngovXqIpVQ6xSL/+iK117FxI8+obKmRgVa4pP8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BB+0VteOwPk/M/jCBUy1NgtwH6hEAA+M62+npFkWrksrpXT55KQi/DbqCn9SsYbqk
	 ta0zQPHh0eUcEUrAIuJ3CiJFo98Y1LuO4PKmkD3eBmZkpxUOOnD3WLhahhm3doUBa0
	 mZQ7M14Rw9TeN1tXHNVE4Ba3sLomcecyFkDS1SyQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfKANHg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 09:07:36 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:33319 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKANHg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 09:07:36 -0400
Received: by mail-pl1-f169.google.com with SMTP id y8so4369771plk.0
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2019 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=gGk53Ri8EY92KWrUxiT34+EanhwdEtJH9QKp4iRSh3Y=;
        b=EL9yPRNbU1KsF8nHk4CGVDBb95DIiXKBl1VFLMoUwEstkRCF8RYcEdcrhDQvnxtbsc
         Aa6z+x0Js6TeMmyFYi+hkd9SB9vpLioV4Cdl5kihYP3Z8AU6UIhvbgDFvgIUK2bA3uqW
         rB5e3xdFJRa7NB0GRReZJV5XfS9n/UYQHnDKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=gGk53Ri8EY92KWrUxiT34+EanhwdEtJH9QKp4iRSh3Y=;
        b=BNdM1sif8w24gf4etmpcau7m+QlS7ibaNg3cLi1mM/UVzx6oX0RM4Tewap4nCaLU3J
         2K/NAsH38J8OcyQ5h9sW3jsG1G6I+GupNBqSVDGNXscu7c02KhQ0nbjMV0if3tHH8Q8E
         PCYoLnZO0qdrd2YGH+gHVh2XqoS4TIzMdh64gFCoknS/Y5q2DbWPKFycGcZLDm2efpD+
         hcqwLnayp9UUDHqCj6sEPT/wk4wDiQ8fJ0Zl1tu4M2+9mFekyjaBFqgADF8gih8BNNTx
         JHCF/Q6HTVOdIJOX7Zuox2A0//f2Zya5RKEuLNfP6s/vM1AZQhamfkKrTJ4oW7uyrU8n
         o4UA==
X-Gm-Message-State: APjAAAXi1fEIGQ1GDd7ELB/Iau5nKgbTLUQKLEentrcW92PAiDOiQ1rA
        +NLib5TZX1jmjbXZIRDTlaaiqiHiItw=
X-Google-Smtp-Source: APXvYqyLpGkaHd3Q+YFvX9NuHp510cZGf6pHyPHo9rwF+HoypcunSPP6xLR6s+v2iH4aGeG95t5Vsg==
X-Received: by 2002:a05:6214:1ca:: with SMTP id c10mr9835147qvt.233.1572613216055;
        Fri, 01 Nov 2019 06:00:16 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id v16sm3612263qth.51.2019.11.01.06.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 06:00:14 -0700 (PDT)
Date:   Fri, 1 Nov 2019 09:00:12 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org
Subject: Re: patch attachments still unwelcome?
Message-ID: <20191101130012.yxtbzz4olyr2hh3f@pure.paranoia.local>
Mail-Followup-To: Eric Wong <e@80x24.org>, workflows@vger.kernel.org
References: <20191101022746.GA25491@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191101022746.GA25491@dcvr>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 01, 2019 at 02:27:46AM +0000, Eric Wong wrote:
> The BDFL sets an example by attaching patches:
> 
> https://lore.kernel.org/lkml/?q=f%3Atorvalds+n%3Apatch
> 
> So the documentation in the kernel advising against sending
> patch attachments seems hypocritical.  Changing the kernel docs
> allow patch attachments could be a good start to making life
> easier for contributors without SMTP or IMAP access.
> 
> Are many MUAs still incapable of handling them?

It's not really that they are incapable of "handling" them, it's that
patches-as-attachments make it significantly harder to do code review in
a way that is convenient to developers. While some MUAs will properly
inline-quote an attached text/plain file when you hit "Reply All",
many others won't, requiring manual copy-pasting in order to comment on
actual patch contents.

-K
