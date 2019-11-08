Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482E1C5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1724921924
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573222631;
	bh=n5sWB6An5Rj01PTecb8DHUCgWMzQI9UoGHOHaOhL9UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CLkxiaZVNS6bS2pgsu4OzdgB5ymJRvj90hqLVCeD7ufwL7QssTlyMOfg4B6wfibvZ
	 fq3xynQn7PrVUIdFBG0UmeqNjkRu6862oVMdR1FTrEi2yxBZ9aBJSyWlxPghlsmA98
	 Mgkz4N87ZzqByXbC5of6vAKzGTjn7CXnf5Uabnx4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfKHORK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:17:10 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33514 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfKHORK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:17:10 -0500
Received: by mail-qk1-f196.google.com with SMTP id 71so5411064qkl.0
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=pCL0iAfy+Y6YXCvEh2BksFciBT0hShfIkJYVgnaUzH4=;
        b=UcEkXqu0HtOqcwAJk7RRwK2QfPi2qn0fiksxgYLD5UyyZwlNDhrhxEOwXPjwunmynq
         p+17/qMIUpoDJPoNGbFJ7CBIIWos72lNa0m9WWIoPwsbH5J+nbBrTetUQksR9NB31LYc
         v4gpTAnYITkxT5Q50bIaeUOIKTOqj0SxVsgxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=pCL0iAfy+Y6YXCvEh2BksFciBT0hShfIkJYVgnaUzH4=;
        b=ADpC0E6bEjV+HWrm8uw59Pll9NXlSfApZL7o1Utod/Jri9efz+zhbDbDoSxvMk0pSe
         mnKd7lPx9RX9A0WeiZQ1nV9CvbXLsIJ8C12MR+VPtMtVFf/UA4+AVEhXxGvzz9CZW+p9
         GxjKTTVLCm86sR60MHUSbis/95tpRDsY6j/+owuFB+k5RpcECavHrzB3c37AQuLz1NDI
         jdcg/2m7tkfz6sp4snNGXhnDASMJ3qLiSJB2vG606UAbgJ01DRWpDWTY0BPdQoiN4BbK
         7Q9HbNc5Cq2FpIRiF1d6hmgv7A7TB+2is6IAHCXJAznPLYDOfqFSVhNgzLqx5RygHHNl
         A9rQ==
X-Gm-Message-State: APjAAAWFohyevG91PTAebz0KCcxhm8LGfx+ICPX5qyqy5tMJHGYejmuq
        P6ISGN/vDtXV8NkEoQ7JsE1SQQ==
X-Google-Smtp-Source: APXvYqwH2TH8aGyykfdP+/KjgUnqOECRn4Qm9umn+NZZHinCqF97btF6ezWRemw80YjVDPAO+SDH3A==
X-Received: by 2002:a37:8806:: with SMTP id k6mr8809993qkd.127.1573222629604;
        Fri, 08 Nov 2019 06:17:09 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id q17sm3829345qtq.58.2019.11.08.06.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 06:17:08 -0800 (PST)
Date:   Fri, 8 Nov 2019 09:17:07 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu>
 <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 03:12:51PM +0100, Dmitry Vyukov wrote:
> Just to clarify: syzbot does not do this on purpose. It generates and
> hands off unwrapped lines. The "format=flowed; delsp=yes" part was
> done by somebody else.

Looks like vger received it already mangled:
https://lore.kernel.org/linux-usb/000000000000c460630596c1d40d@google.com/raw

Would you like a mail sending account so you can use mail.kernel.org as 
your outgoing smtp? We promise we won't do anything that nasty. :)

-K
