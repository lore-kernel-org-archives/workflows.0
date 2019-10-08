Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9B2C35280
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 16:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9A7321871
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570553521;
	bh=ENSbe3UVon5aTn3jCTcPpxqWKNXW6uhzhJjjROxLFEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EIS/CIy8dK39qzR3D+Q8h+twiQQFpROK2+ADeaVOzLJKU0+1Dl8mITtJj45iv1TIw
	 RUoM1pXfnnxkAuQsTNE3xH5irVuKddYKOTeJ2FvEYfBXQbVuG+XowU5W97KHaLEEYM
	 yxsodvjJR3e1XJ2vIzYnBSXMnaOzcpQ0YSZbStdY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbfJHQwA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 12:52:00 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45580 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfJHQv7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Oct 2019 12:51:59 -0400
Received: by mail-qk1-f193.google.com with SMTP id z67so17381430qkb.12
        for <workflows@vger.kernel.org>; Tue, 08 Oct 2019 09:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yz/d+izA+uI3f4LK4OflvGN8D1L99AAYGbYXr3wgTbo=;
        b=QwBlK0ei/2QgNjSRZNbjlJd67rHHIsZad/TPsyuRoMleFt/hbAFbIiqzGoX/jZkLmw
         iMdSvUMWbKxbWRmpK2vR80Bf7z2+C5vvSLk5rT6pKbSke84biha25rjcasvlksb/i343
         Km4/+OJccuGlQP4FS6J/WFPZ4Hz/CuHQTcD1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yz/d+izA+uI3f4LK4OflvGN8D1L99AAYGbYXr3wgTbo=;
        b=LhBNALjTZNjeQ4ye/MKY1xjwv8bBI1qQ2mcrme+XjoEe6FdwdoXqVie/qY+yWMzzzM
         s64xTvHsdBlJXPM8cRewP9/EqxyA6ij49gapkohYEns1MEPjJ1IbAYfNGxxVsAl4ONvl
         5xYdFzFNugZsa6wbOdAoydGiTJRbIwEp2S8VLwBSTz5aK4NEWquBmLWXzhuKIGywZx/M
         wz0Y+eH03x++7orjeRclQEFtrKYvKu2s9nfg+9rT+2cLF3nphfSajpDCb+wN0XLWmibV
         zwUrc6t/sXQBYsDIoHfzwwNgrpvxSBWafrA+qy7srYD93kpHY/Rg3LHZ4Hgf0pv5rQGu
         fuiA==
X-Gm-Message-State: APjAAAXxRrhHdY8yhdmvquRyxMZZxevPc8FRjyiw6a56FLuAgS+RZGxC
        q8DhURIo1zqLDrukaHZrTVYAuw==
X-Google-Smtp-Source: APXvYqzkcxHQlgeeT5HUp+c7Q1TaDrl2NGIMG7jNho9Ut8hE1XtSEVZuDtQQiIYYwlYaHk7yp2adow==
X-Received: by 2002:a37:5086:: with SMTP id e128mr30718174qkb.471.1570553518288;
        Tue, 08 Oct 2019 09:51:58 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id k23sm443914qtq.68.2019.10.08.09.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 09:51:57 -0700 (PDT)
Date:   Tue, 8 Oct 2019 12:51:55 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Dmitry Vyukov <dvyukov@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, jani.nikula@intel.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20191008165155.GA30571@chatter.i7.local>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 08, 2019 at 08:46:02AM +0200, Dmitry Vyukov wrote:
>On Mon, Sep 30, 2019 at 10:24 PM Konstantin Ryabitsev
><konstantin@linuxfoundation.org> wrote:
>>
>> Hi, all:
>>
>> In retrospect, taking a week offline vacation right after getting
>> everyone excited about workflow tooling was not the best timing. :) I'm
>> slowly catching up to all the good conversations that took place while I
>> was enjoying the fine beaches of South-West Iberian peninsula.
>
>Hi Konstantin,
>
>Are you going to attend OSS Summit EU? If yes, I think we should sync
>up there. I know Dave and Greg are there too. Perhaps we could
>schedule some kind of semi-formal meeting?

Unfortunately, no -- we have limited budget for traveling and I burned 
through mine by going to Lisbon. I'd be happy to work on a draft 
document that expands on my tooling vision (I'm doing so anyway), and I 
can time it to be ready before the summit so you can review and improve 
it. My hope is to submit it formally to the LF by the end of the month.

-K
