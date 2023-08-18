Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A42EE498B
	for <workflows@archiver.kernel.org>; Fri, 18 Aug 2023 18:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355814AbjHRSDh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Aug 2023 14:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379345AbjHRSDa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 18 Aug 2023 14:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4284421E
        for <workflows@vger.kernel.org>; Fri, 18 Aug 2023 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692381758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GYthceSjVxdGe+RNHvsb3jj8Dlrg9zVr48sDJdwo2hQ=;
        b=ZhNYBTAa8FHJGWQcdsNqY2Sa004XVEh0oB3tc8ixkjaTf54MYq28lKGWkh3f2H97/8BOXZ
        2vIsO7xIyDddqOVNxkP9DujCx6p8JdsbfBtHVlbb+CLu8vmd0sQtJlnY3IFds/VzklYRjB
        OXEpopsjeJ7MVy+Ljs0DSeGRM0ML+Nk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-ne3TLqn8Nd6lqd6nJN7n_Q-1; Fri, 18 Aug 2023 14:02:37 -0400
X-MC-Unique: ne3TLqn8Nd6lqd6nJN7n_Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99cc5d18f78so71014066b.3
        for <workflows@vger.kernel.org>; Fri, 18 Aug 2023 11:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692381756; x=1692986556;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYthceSjVxdGe+RNHvsb3jj8Dlrg9zVr48sDJdwo2hQ=;
        b=GIOy8mZYNNF64FZAYy8dblQ456ihx+sl7hC1xtj5BgaEtecQWg6OpL9aQLmrf5oQxF
         6o0su20z4bUBjCNMPEKFgJbzL2mnZfxyC4VCt3/KwgRRhF6JetqKIz/7xHeakEgZ5RkS
         ymy9WubSx2MoxUmn9yyruZHXV6cDcjOkpvHvdrpN8g7DNAJHZqpLq5lQUZYVJ7rDazX9
         bIWmX7G/5inPoFeW2K6mvO46DMnyRC2Ff4ILNyS1re6uYNUgeFWIPmnYt4LNJCxN2n2k
         tLEHHjheXWO8yZVpkZLS0KreoPC7j7o/fWCZj9vzeYojucyek8Au6udDbo4Ptyu/8YbV
         CPow==
X-Gm-Message-State: AOJu0YwQCZ+L8bxEjJZ1IqHHqgk2+28we41aUlGCiLrOdAdjwhH6vg7q
        XxHYFNM39A1SZ+ZiYtD/EQ3uX0lqEM/b7gfxxn5sJVQbjR6cZp7shrzn2ZUtz2jxkgls//PWIy/
        w/PcO3S/JtXkQA5Q71zVk
X-Received: by 2002:a17:907:2c41:b0:99c:a93a:432f with SMTP id hf1-20020a1709072c4100b0099ca93a432fmr2278875ejc.1.1692381755960;
        Fri, 18 Aug 2023 11:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiJtI/b79tOMzsc/f8/5cpHCWl0G1JGKeGBGYJagUsDNOqxAxUZDxTi5VuCPKKt8lnZoJxhA==
X-Received: by 2002:a17:907:2c41:b0:99c:a93a:432f with SMTP id hf1-20020a1709072c4100b0099ca93a432fmr2278858ejc.1.1692381755585;
        Fri, 18 Aug 2023 11:02:35 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id fx15-20020a170906b74f00b0099290e2c163sm1459644ejb.204.2023.08.18.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 11:02:35 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B7BFFD3C51C; Fri, 18 Aug 2023 20:02:34 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Selective lei filters and replies to old threads
In-Reply-To: <2023081720-wrath-winnings-bb16@gregkh>
References: <87ttsxbvqd.fsf@toke.dk> <2023081720-wrath-winnings-bb16@gregkh>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 18 Aug 2023 20:02:34 +0200
Message-ID: <87msyob551.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, Aug 17, 2023 at 04:15:54PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> [0] Side note: if anyone has a nice trick to specifically exclude Greg's
>> stable patch bombs from this, I would be interested in hearing about
>> that as well :)
>
> I thought those stable patch bombs had a X- header on them, like:
> 	X-stable: review
> and
> 	X-Patchwork-Hint: ignore
> but somehow it looks like I'm only adding that to the first message in
> the stable-patch-bomb series.
>
> Would it help for me to fix my side and add those headers to make it
> easier for you to be able to ignore them?

I don't think it's possible to match on arbitrary headers in Lore
searches (maybe public-inbox could be taught that?), but it would
certainly aid in adding local filtering after fetching which would work
for me as a workaround. So yes, please! :)

-Toke

