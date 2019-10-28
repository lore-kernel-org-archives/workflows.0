Return-Path: <SRS0=MPmA=YV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207E5CA9EC0
	for <workflows@archiver.kernel.org>; Mon, 28 Oct 2019 11:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E35D820873
	for <workflows@archiver.kernel.org>; Mon, 28 Oct 2019 11:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uALaWMVf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbfJ1Lmd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 28 Oct 2019 07:42:33 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:53869 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388603AbfJ1Lmd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 28 Oct 2019 07:42:33 -0400
Received: by mail-wm1-f51.google.com with SMTP id n7so9084654wmc.3
        for <workflows@vger.kernel.org>; Mon, 28 Oct 2019 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=10FLZkYGo96gCxGDRlAevXfanPTvDo4SE+UUvff17q4=;
        b=uALaWMVffF8Tcb1KYM3rP8Od5Lf1WaYjynEWzEFpF3lNwh2OFxhGQin+jSfKbuXJ4G
         QZq7QAe3MvU4xFlisgo4iKuUTXRPJh5+ve8E572m3cmHpnlwpc5o9hRJAusGAjrifl4j
         HjEKDHqDQoGLDyWC0K7OsOVObRrmPX8rSCM0lHoEsQ+HPdqZI+1NRJV0jqlZx1Pv+X3+
         pAnfQgA+wo5UBsyBmr4MthlDMSpRrAODTfLsYPLSVCnkOpdimZSqv6U1ditWVFeS42MZ
         C1+upsZ/9pXH+XZjlfVTFTUurLKLQlxBo+eNC/0y1Kvw8NpveGPyg/0Gb9JVQ2+EMkn7
         AP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10FLZkYGo96gCxGDRlAevXfanPTvDo4SE+UUvff17q4=;
        b=bbwBhssBfsBzyM0NdaVWdrVBllkN8mb7dn0GAsAnfpBmjW0A8FfHhw1pi+NXVjFHfX
         H9nA4G7EOioFiVuJtQgMG8ldNPdld9yizncLnB5+cwt7AS57opV0+6jb3qULaNzGGXgi
         LLbhaTB7e9pBTumTqWOmhgp6rFvPgy2ogUd82xj8Uq7ydlmbOBSkU3s5GgPmqN/pVvo+
         HEvxfrVadz4XfskD+GNorbV8BTaBnS1l+2hnNUsk93T0Cwq5wlK0t6I4i6+md8i8XNJK
         9Q2o+ZbFEEaK/YHno42JZohKJ7gt7J+LQLjOdzFrSYibSe0sWGWZ26xnVreKSpfsC7eu
         gr9A==
X-Gm-Message-State: APjAAAV2y6OkVGaY0YfZIsziHZzTj9IoS7v80B7oE9zgjERl/LurcaTw
        r72XFKZdyPq+xKwFpCuXteMlrT7uNps=
X-Google-Smtp-Source: APXvYqzO+8B6jmYlywQD8kXFhnbYcGY4LryKszBo3WQrcbLC3PZfJnTevw4IykIfSwUSMzpCuPCxVg==
X-Received: by 2002:a1c:1d7:: with SMTP id 206mr14694301wmb.33.1572262951131;
        Mon, 28 Oct 2019 04:42:31 -0700 (PDT)
Received: from [172.20.36.247] ([91.217.168.176])
        by smtp.gmail.com with ESMTPSA id c189sm14887645wme.24.2019.10.28.04.42.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 04:42:30 -0700 (PDT)
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
To:     workflows@vger.kernel.org, konstantin@linuxfoundation.org
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <508ebea1-f5c6-618a-54d3-ece33c8956c9@gmail.com>
Date:   Mon, 28 Oct 2019 06:42:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/24/19 3:58 PM, Konstantin Ryabitsev wrote:
> Hi, everyone:
> 
> So, if I read everything correctly, the meeting shall take place at OSS EU
> Lyon, on Tuesday, from 14:00 to 15:00. The following people have expressed interest in attending:
> 
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
> 
> (If your name is not on this list but you're planning to attend, please follow up.)

< snip >

I plan to attend.

-Frank
