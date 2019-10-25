Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD7DCA9EA0
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 13:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E007B21929
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572010579;
	bh=gvyMmjcZAv2K/HBnWbv7MDAtp+ImoNRM7r9UueOHxUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qv4UnnLliyULhpolrB2cpYqAv/3ZvyW8meB92GUMW2npuyLak9k3Kr9Hxe0M/o974
	 EOstgnlWSxUfoIQddFuCd179BHt+y1a9LjSRKdTw1M2Y4m/BUpnZfvhNN4RRIQ6hdh
	 8w00zEnxEYblQwmWp+t8AaLeKs5ba/FONGD/MnbE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504793AbfJYNgS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 09:36:18 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:35442 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfJYNgS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 25 Oct 2019 09:36:18 -0400
Received: by mail-qt1-f174.google.com with SMTP id m15so3282993qtq.2
        for <workflows@vger.kernel.org>; Fri, 25 Oct 2019 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=knQ8WrjmPKhYbWNbD8EOikb+mN8igIzmRr+06Spz4V8=;
        b=EswTE3eIklJfq6DsqIwN1/zrYMVktzWUJUprm3sr5W3e2hvw1/iFj+NQ7P4V0Oil6e
         RiRovYn9Vw08HLTvpHL9ECQj7bjKTg9LxDrF+nGwMSPGwMyFeElDzHIpdZm1q6FnUd58
         APEiFJhl70RuLKJm1v6S4phTmLiRGQyFK5ULA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=knQ8WrjmPKhYbWNbD8EOikb+mN8igIzmRr+06Spz4V8=;
        b=dKK6e+9kEUU544j+KwORmv40hJs4W69JYDOhboGjUFkbonBuPYpLJ59dGKnAlvUBSh
         lWP0pRUkdRLAfuY9+rwsLn2OXP+gZEQLUYhH4MqCVFm9mn3SLeYOxL85w/VN/aVpFHx4
         UD5yWDZyERibIfSE2IZsdfZfVGRSl0gkR2RTdLNNRT1Ln1J9nuw1o8eka2A9KDolWIt0
         i0EIovMp4A5qJkZP9XhmwyabYltYwJEIyhrTczdrklHr3sUFN5wYIESQqwEMgDIbWFQc
         m6YmWZo2nA6104fYSjZYvDYdbhf17IiLjgyR9okcOQyQ5+sj64lxzmFcGhCopeRGfv6e
         OR8g==
X-Gm-Message-State: APjAAAUB+mmTmrMfVKa38aA0A6bAzBZ09zxA7njA+acy6+UoSF73kZQV
        IsTNU/R8Tc3/80gvl5cq+l5qQQ==
X-Google-Smtp-Source: APXvYqxM8u9zkAnPpscWqzlzeIM4D2MZK3CB9KNwrH1rcz/JDlmyTrva/CSyq67mVz6QJUswOo0aSQ==
X-Received: by 2002:a0c:fe02:: with SMTP id x2mr3102163qvr.117.1572010577340;
        Fri, 25 Oct 2019 06:36:17 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id m63sm1092240qkc.72.2019.10.25.06.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 06:36:16 -0700 (PDT)
Date:   Fri, 25 Oct 2019 09:36:14 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Veronika Kabatova <vkabatov@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        workflows@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
Message-ID: <20191025133614.spkxym5k6fp4ofw5@chatter.i7.local>
Mail-Followup-To: Veronika Kabatova <vkabatov@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        workflows@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
 <20191025111610.GB4740@pendragon.ideasonboard.com>
 <CACT4Y+ZzszuHGOAnG7a9vzOOmD+WJVGe7Vm+Oot=Cwjv=izjhA@mail.gmail.com>
 <239435160.6625525.1572006247406.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <239435160.6625525.1572006247406.JavaMail.zimbra@redhat.com>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 25, 2019 at 08:24:07AM -0400, Veronika Kabatova wrote:
>> > > 3. CI and bot integration
>> > >     - identifying the data that maintainers/developers want to see
>> > >     - communicating structured data over email
>> > >     - providing consumable feeds of CI/bot jobs (as public-inbox
>> > >       repositories?)
>> > >     - avoiding bug duplication
>> > >     - recognizing when a bug is fixed and following up on issues that
>> > >       nobody has taken on
>> > >
>
>Hi,
>
>if in the end any CI discussion fits into the agenda (or there will be
>a separate discussion), please consider inviting CI people too. They can
>offer information about what's feasible to do from CI point, and note
>any feedback to know what we should adjust for CI to be more useful for
>developers/maintainers.
>
>I can attend for CKI side and there should be multiple people from
>Kernel CI and LKFT attending the conference too.

I'm leaning towards having CI folks organize a separate session to go 
over integration points. I will be happy to attend that one as well, but 
if we have too many topics and too many attendees during the meeting we 
are trying to organize, it is unlikely to be very productive.

-K
