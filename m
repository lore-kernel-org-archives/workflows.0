Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC5AC761A6
	for <workflows@archiver.kernel.org>; Tue,  4 Apr 2023 12:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbjDDMhR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 4 Apr 2023 08:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbjDDMhH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 4 Apr 2023 08:37:07 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B863E44BA
        for <workflows@vger.kernel.org>; Tue,  4 Apr 2023 05:36:35 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id n14so31324615qta.10
        for <workflows@vger.kernel.org>; Tue, 04 Apr 2023 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680611769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSpzJzf1FOM6UnLnSTOqyKayxzDBWTCflEqOjyBSbCo=;
        b=aROFRSMiUndfVZ0M+rPTRZvKbg0G3SrN6evNiK/VNwVed0c6Iio2IGw7q5tfNenTi/
         ZYscQ8HaLXqbzKe6CtmHbNUUREysb2gwejhFwHpm/uSgW3TIKjFciYcG9KJwiDzBcBLD
         ECIA0MoDBox8gBNQHDEB3ZwvKdpvw4ys0qypU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680611769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSpzJzf1FOM6UnLnSTOqyKayxzDBWTCflEqOjyBSbCo=;
        b=YBUFf6SkQ+K11wCPNL03pv+Zd61yh5CJ4KZTi+L8P3sD7zkNZ9tjJHt+APUMyYkVvH
         OmEwzEE+ayXHOnQuX11bGMXFyy0mVa0EYZy9dcQ1U9RdHsUs8y//VzEc/Ackx9QwVXMH
         on5lZKow6owyyBGOkZp52cM2Q5yac/UDrvdAdiuv09sSZ8UbiZgAX+rLTtAa4d1OPmle
         dor0qK1wkHO883iqk8xbtIT38OvZrgtViXj5RrcFUfz8U+ea4z2hHgV+Mgnlp5aS+mLi
         nyKNMI1Y16lxfG/uFBt1fLEbnTXCgVBJ0kgrmZxx7ZQinpj36rJWBe3oBKsmp4Glhedp
         zHyA==
X-Gm-Message-State: AAQBX9eJ2nRGk20jF5uH3ql1gJklztRuVk0Mumb9LP0RQfFb/ITAdfp7
        a1VPsLyEYxgmyckKnov2vwzcliyj5LGQwYFBqZw=
X-Google-Smtp-Source: AKy350bmIBXc+urbVoIz0HcgJ/oIEa1NP49n3CJPHcmGi2xKjny3EOfz6eI161rjIxZ0tXl+zYAJGA==
X-Received: by 2002:a05:622a:148a:b0:3d8:6b0d:f9a4 with SMTP id t10-20020a05622a148a00b003d86b0df9a4mr3121325qtx.44.1680611769053;
        Tue, 04 Apr 2023 05:36:09 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id q19-20020ac87353000000b003e387a2fbdfsm3226631qtp.0.2023.04.04.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:36:08 -0700 (PDT)
Date:   Tue, 4 Apr 2023 08:36:07 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     workflows@vger.kernel.org, aros@gmx.com,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230404-bacteria-refinery-a97393@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Apr 04, 2023 at 07:58:40AM +0200, Thorsten Leemhuis wrote:
> Would be great if bugbot could CC the regressions list for all bugs that
> have the regressions flag set to "yes"

I'll see if I can add this logic and make it configurable.

> How does one make bugbot forward a bug to everyone in the signed-off-by
> chain of a commit that caused a regression, which might or might not
> have a bugzilla account?  When the reporter performed a bisection these
> are the primary contacts that need to be reached out to, but the
> maintainers and lists for the subsystem obviously should be CCed.

I can add a cf_bisected_commit field that can take a commit-id. When gathering
recipients, we can check if we know that commit in one of the tracked
repositories, and get the author field out of it. Would that be sufficient, or
do we need to run get_maintainer on it for a full picture?

Note, that you can also add addresses to Cc: on the thread -- they will be
collected behind the scenes as each message is processed and any bugbot
notifications originating from the bugzilla side will also include them.

-K
