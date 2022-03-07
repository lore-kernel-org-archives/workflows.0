Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8605C433FE
	for <workflows@archiver.kernel.org>; Mon,  7 Mar 2022 16:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbiCGQth (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Mar 2022 11:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbiCGQtg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Mar 2022 11:49:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8621722523
        for <workflows@vger.kernel.org>; Mon,  7 Mar 2022 08:48:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB576109E
        for <workflows@vger.kernel.org>; Mon,  7 Mar 2022 16:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D918C340EF
        for <workflows@vger.kernel.org>; Mon,  7 Mar 2022 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646671721;
        bh=3h8NcIn/Vxbpg/ik6/YcJvEoY+OYk5NGjgCnDdbExjI=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=CHyzF1vxcTaqFTCmsMMmnwBz3LvI3M9OeAXeO+gfHEk+VTFM6hH2E0wxE0Uqiuzvp
         SpwBMW5QM0rZgZtOlnMs62rIH/hziluqpKEUKCNQGziw5VBTIAoReuzk8YOgeMha5/
         MVBLsfl0sWNSH42YsVEzQRrfjsgFlXqAGo0z5jzVeDFCeIj6raFw2m67JrMK8kg+og
         XjQMI1Pzml1xgTi4tuKlRZvJLFFBMkod5BINEGJrOyZlmlVZflm5CyrvCjh3s54MIy
         ZBjCaT62soAEJcY+xzKkvcZg880TqESMe5kqjQIP8qjTUWiZE1M064mmYDThW9bpu/
         Qu62sx7HqGRRQ==
Received: by mail-ej1-f45.google.com with SMTP id dr20so33219997ejc.6
        for <workflows@vger.kernel.org>; Mon, 07 Mar 2022 08:48:41 -0800 (PST)
X-Gm-Message-State: AOAM531M3qjzDWYCPIgJPuae/g7nMznWnzj6o63g+45o5TcRpoqlC5pU
        t9lJKzPll7Mj7e3JHs+DuKltKjwkAJ13MpXhcQ==
X-Google-Smtp-Source: ABdhPJxNx/yhyXkdSykUuuaYFY1crBa+OU4K2/nmxyeEkmq9BOCgzAUQR7qKR20vMR/W9nJL+pFxqryIHDx1rexHJQM=
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr9538347eje.82.1646671719681; Mon, 07
 Mar 2022 08:48:39 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
In-Reply-To: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 7 Mar 2022 10:48:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+gozKWtx_FLZf=peA=odAssF5uxUZOpn_hmHYPt3pz0A@mail.gmail.com>
Message-ID: <CAL_Jsq+gozKWtx_FLZf=peA=odAssF5uxUZOpn_hmHYPt3pz0A@mail.gmail.com>
Subject: Re: lore+lei: getting started
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 5, 2021 at 12:07 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello, all:
>
> I am going to post a series of articles about public inbox's new lei tool
> (stands for "local email interface", but is clearly a "lorelei" joke :)). In
> addition to being available here on the workflows list, they will also be
> posted on my people.kernel.org blog.

I also wanted to do non-persistent searches. Essentially, the lore web
interface search box on the command line. lei can do this with the
right options and some avoidance of shell escaping. The shell script
below is what I came up with.

Note I have the stable exclusion added because subject searches with
'get the whole thread' enabled often picks up Greg's 100+ patch
series.

Rob

8<------------------------------------------------------------------
#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only

usage()
{
        echo "syntax: `basename $0` [-t] <query string>"
        echo ""
        echo "For query syntax, see https://lore.kernel.org/all/_/text/help/"
        exit 1
}

while getopts "ht" opt
do
        case "$opt" in
        t)      threads="-t";;
        [h?])    usage;;
        esac
done
shift $((OPTIND-1))
query_str="$*"
[ -z "$query_str" ] && usage


tmp_mbox=$(mktemp)

echo "$query_str" NOT tc:stable@vger.kernel.org | \
  lei q --no-save --dedupe=mid -f mboxrd -O
https://lore.kernel.org/all/ -o $tmp_mbox --stdin

if [ -s "$tmp_mbox" ]; then
        mutt -f $tmp_mbox
fi

rm $tmp_mbox
