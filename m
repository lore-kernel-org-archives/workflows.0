Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6332BC76188
	for <workflows@archiver.kernel.org>; Mon,  3 Apr 2023 21:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjDCVv7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Apr 2023 17:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjDCVv7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Apr 2023 17:51:59 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E892CA
        for <workflows@vger.kernel.org>; Mon,  3 Apr 2023 14:51:58 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id dw2so5070469qvb.11
        for <workflows@vger.kernel.org>; Mon, 03 Apr 2023 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680558717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjT5o4xvNfeO0u+mk4eqCgrBLdiXC2jtMg+3Cg0Ah+s=;
        b=BY6rpDxeKb8DeVdtM+UrqqtBzn9YBmX6bA4aCVzqc15IKltnlC8nzdzXUX2K0Vrc5s
         rR/AJVkJ/0cZn1OVgnmzyfP4YNtlc58rT+RvyhSRSjBSmb5NfwKoX3UW3LSA8aMNQnQe
         YAV8wc1lGbzCFiM7EV+aIi7nY68VPP8i17rus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjT5o4xvNfeO0u+mk4eqCgrBLdiXC2jtMg+3Cg0Ah+s=;
        b=GVHZLeqz1dP2hgGy9Prana78B2ifBNnWKILUv/YLetONdayvsrUiavzTejFj2KAC2+
         k+dzRqMSGhasfRwOt6XWDGNYC55dG9ubLSmNd/1/JKTj/ubcbB9Gz+WOsyb7qozrLilW
         S8NSvHNiFWoX5qzJi08HdQvcknDp98NZRKkaDcFgWMJ0arRx93axkAQXvQQMrudW6X3T
         0h/yqF0c1vJab+4hhhf79Sw7/0uQCmZ61FMMpcVBtlDLg895jrsdWuowFub/pELIKjSa
         KNsiOlQOd8bpsSARc22okYzkwHX1UAOw6GLev8Jc24x7BYPUx+dfQtaup4BYP+Zj6w0t
         OoHA==
X-Gm-Message-State: AAQBX9cT/yTbIOiA7XRjiarkCGzUGIYoNTj4SuZ2DjMJxHY1OSi2tU5G
        R8AD47gZGylZ3C/lWAUEx6cdkA==
X-Google-Smtp-Source: AKy350bTaGQ08kEu83u5p/ijNr8qy5I/X/lIvnEcVkcdouB39xLUA34m5/51K/KXWuL6r29WiCrKHw==
X-Received: by 2002:a05:6214:224a:b0:571:698:eac9 with SMTP id c10-20020a056214224a00b005710698eac9mr39848431qvc.18.1680558717538;
        Mon, 03 Apr 2023 14:51:57 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id a14-20020a0ccdce000000b005dd8b93458bsm2927653qvn.35.2023.04.03.14.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:51:57 -0700 (PDT)
Date:   Mon, 3 Apr 2023 17:51:55 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Kernel.org Bugbot" <bugbot@kernel.org>
Cc:     aros@gmx.com, regressions@lists.linux.dev, bugs@lists.linux.dev,
        workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@leemhuis.info, tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230403-favored-subsiding-6e49bd@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Apr 03, 2023 at 09:47:49PM +0000, Kernel.org Bugbot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=217297
> 
> There is no need to do anything else, just keep talking.

Thank you for illustrating the "may explode" bits. :)

Unfortunately, triggering on key phrases means it gets triggered when you're
discussing key phrases. I'll make sure that this only happens when the key
phrase is on the line by itself.

-K
