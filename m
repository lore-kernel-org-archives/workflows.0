Return-Path: <SRS0=MPmA=YV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA1CA9EA0
	for <workflows@archiver.kernel.org>; Mon, 28 Oct 2019 09:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 172202184C
	for <workflows@archiver.kernel.org>; Mon, 28 Oct 2019 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572254760;
	bh=DijshxdTO8+LBi+kXZIArV3um4ZcfF1oKXp5VIERo5I=;
	h=References:In-Reply-To:From:Date:Subject:To:List-ID:From;
	b=KtHq/8aH6x++kFzXiXXjUPNMRDrGaNWa1gsWBIYPh54pZK4yr+6F3BElMDKcLX/m/
	 5J/7Oh1hK2THhwgcg7WAMbmUi2N3AMmkwlftbhsOCW0Yut34cvIFHwTmWcnfPKiYbA
	 NS/RyGEWdx5M1snKXamJkTh8E1RE/nfUntfRbd0s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731360AbfJ1JZ7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 28 Oct 2019 05:25:59 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]:41101 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbfJ1JZ7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 28 Oct 2019 05:25:59 -0400
Received: by mail-qk1-f172.google.com with SMTP id m125so3875980qkd.8
        for <workflows@vger.kernel.org>; Mon, 28 Oct 2019 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=DijshxdTO8+LBi+kXZIArV3um4ZcfF1oKXp5VIERo5I=;
        b=SabPr+gnjr/r8hR+L1ucCHS5JVaWFLvuNVNLJgd+9RK9sLztbY+accBwEdR0mFDIQZ
         Gs5STLGA3KUM0mRXFFExAN3LZ1XCQjY2eK2jYOAOphEcMyjI0KIuyctwEHP67Ui+it5m
         jWUBUm+J98JLwwetjLVQODFP/MfF0rSmrQZsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=DijshxdTO8+LBi+kXZIArV3um4ZcfF1oKXp5VIERo5I=;
        b=tIXTrbZMsMPNie5IKajvCJo3ijKZ5V4aZ6VHz/HugyQ0RODp9rKN2Om2B0UV7p8Hsu
         sm0iDwDMtvCkwNH5ualRLXoH2/2AQOZU6UzUruP62Qls5XTPJIbLU2JuBmjD314QT/Xt
         G023cYBpb1PwdsWz59BbCBdel0cR5Dcn9wmk2455qU3b/4BOkNa2iouf1vzwvBo3ZK+q
         YPA71O+4OZu/qUepZuzN/X2gzmMnadcml+1zHQCMt+iEyYqKyJ4ff/XIx0RIgnwCKVaN
         /t+KmL5cdF/9T2LpLKyLIHWmr22/NRakXpZvPn2T1xcOPjcU3BzGR2+lcbavYszufR+9
         0vkQ==
X-Gm-Message-State: APjAAAXEXIcUVs0T+o/+bkBLlZM7VcNLuuaEFNkSNXeMywHJfFrAE+f/
        8c/YSYqiKalU+BYtTsbZLCy+/BiP9Gom04UszbTkdZsHe51JhA==
X-Google-Smtp-Source: APXvYqyxo3iUqgryEBCT1VQN++c5Rk9mycVKkR5ykdIGCl5MPFhvcZpgo7iiOuADUUZg9ymFYKVMtSVX1e3PVL4O4Do=
X-Received: by 2002:a05:620a:21d0:: with SMTP id h16mr3916807qka.108.1572254758102;
 Mon, 28 Oct 2019 02:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
In-Reply-To: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Mon, 28 Oct 2019 05:25:46 -0400
Message-ID: <CAMwyc-TRnJdiNcKiwK1cAUysGqQQLucPDHb_xRWf+-iCm2medw@mail.gmail.com>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
To:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

OK, slight complication. It's a lot more people than expected:

> - Steven Rostedt
> - Greg Kroah-Hartman
> - Dmitry Vyukov
> - Konstantin Ryabitsev
> - Christian Brauner
> - Laurent Pinchart
> - Jon Corbet
> - Daniel Vetter
> - Nicolas Belouin
> - Shuah Khan

- Nicolas Belouin
+ Daniel D=C3=ADaz
+ Rafael Wysocki
+ Han-Wen Nienhuys
+ Kevin Hilman

That makes 13 people, and now that I'm here, the developer lounge can
accommodate maybe about 18 people total, meaning that if we were to
meet here, we'd have to pretty much kick everyone else out. It's also
in the middle of the sponsor showcase hall, so 13 people would have to
speak very loudly to hear each-other. We *can* make it work, but it
will be suboptimal.

The bookable meeting spaces also cannot easily accommodate 13 people,
unless we rearrange the whole area (and it's also in the sponsor
showcase hall, though in a quieter corner).
I'll work with the events team to see if there are other options, but
currently it's not looking promising, as all rooms are occupied by
ongoing events.

I'll follow up shortly.

-K

Konstantin Ryabitsev
Director, IT Core Projects
The Linux Foundation
Montr=C3=A9al, Qu=C3=A9bec
