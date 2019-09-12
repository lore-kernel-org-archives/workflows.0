Return-Path: <SRS0=qG9y=XH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CB1C4CEC6
	for <workflows@archiver.kernel.org>; Thu, 12 Sep 2019 13:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F8412075C
	for <workflows@archiver.kernel.org>; Thu, 12 Sep 2019 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568295563;
	bh=5Ev4qxGWe1N1tFU8X40YuWFVKZrR6qVhcqsQ+ScDwoo=;
	h=Date:From:To:Subject:List-ID:From;
	b=Bip20NZlB7k66EZyiJQeUE585DwmelQeVkrhiDldu/kdDWDyiCCZEEX8umBqebu/B
	 inPOiNkwqrsnkx3rBxzjYf9gHb9eTXWQLSdll7rlBwouf7wQuwhfWxfQCqex4OBlqu
	 Bb7VcBoCoD2vTqxhwlqLPyVVMr8VN8UXmg7NCCFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731650AbfILNjX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 12 Sep 2019 09:39:23 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:40544 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731283AbfILNjW (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 12 Sep 2019 09:39:22 -0400
Received: by mail-qt1-f182.google.com with SMTP id g4so29622875qtq.7
        for <workflows@vger.kernel.org>; Thu, 12 Sep 2019 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=5Ev4qxGWe1N1tFU8X40YuWFVKZrR6qVhcqsQ+ScDwoo=;
        b=iLAxIYQ5PXJ9/EoLz+jW0AwCrqMH7LcLx42DuP9p+2U7bVoFaboyu4xj5UqiCLHMKn
         HSPvLbfqNe/CWdEYRK7TjLmLhiYwo87b2Mc8ofRU23Aij+88km0W27G3ZMOuLL/D61JK
         /UR0t2+RTHUdTo41vPlH4/i6ykKqrw1r8jPV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=5Ev4qxGWe1N1tFU8X40YuWFVKZrR6qVhcqsQ+ScDwoo=;
        b=jjZ1sQGpJfL4YNpP0krWNvLKxgJ0xeg3XZe1VqwWB1ev+NRiWTkWM2w4nmtR7tXgRQ
         U3fK2xRStznF272rayZ9IxuPTJcGAlRb5SU2lI3a3xsE16bLhnGWTPqA2bB/1tKH4tc5
         i4wgDBANPheVBQ3mJoLkHp6NzhLfDWz/bIP22+eobtswLjKmGnIct99y7XA/lOE0c/V9
         wRHuZrGfvGv03vmH/Q8dRm4IecthUmXcsKpi4uYnIGEfFNdCAYJpMimdIxI1+djzWLHz
         XXu3yQ+6JcDuBKB2AonUCCoHOHzbbvY+sRmKCG2FttLN+K3vM62NBCUhZ0KrMmwJIG25
         ITCg==
X-Gm-Message-State: APjAAAW3oypXLa1ZzNHWVxmfUpicWX4xCUAiMhZh7ph0dedU+F7L32Ci
        p+UcyVAmMc5UzWn759QOBLTU9NXww5JTfRua
X-Google-Smtp-Source: APXvYqwMqs34lR3dy7ZOASo72t4x+x4zmjkWbs27MboPdE1IlvFMwfCV/xqNU2+yWa9ViL+OAkVTPg==
X-Received: by 2002:a0c:fa52:: with SMTP id k18mr25259745qvo.99.1568295561506;
        Thu, 12 Sep 2019 06:39:21 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id k11sm10704384qtp.26.2019.09.12.06.39.20
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 06:39:20 -0700 (PDT)
Date:   Thu, 12 Sep 2019 09:39:09 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: Workflows is now archived on lore
Message-ID: <20190912133909.GD16671@pure.paranoia.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello:

Workflows list archives should be now available on
https://lore.kernel.org/workflows/.

-K
