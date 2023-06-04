Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F074C77B73
	for <workflows@archiver.kernel.org>; Sun,  4 Jun 2023 21:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFDVyC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 4 Jun 2023 17:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjFDVyC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 4 Jun 2023 17:54:02 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A96A6;
        Sun,  4 Jun 2023 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=v0kdGZEJ992DG/hu03jxO4B41LPgZK2Zh/+I1NymOz8=; b=StVZgoVqk+aDAbbYXo2UwJfXqt
        zpDTma/LeYDNQzzQGXslI5cjWRKp46gMnKqxo0I6A2dKepC+ZZ+yocTHLN/ArShm5pzF0ooftDjqa
        W7xmE3F6+HQ8QH0OXCqLSHvJZN9qNseWPG4xNWt+psn1qYFEF6kmfhCBJekiKzcT1a6zVPpLM454a
        zJ+Ijsr72HcMVdXvA2BnW8zkXqzy1fR2vkDfGdiA+MQwrsI8aQFQvvKKlHnvv0tdZQUgTSvXgtLtL
        zFK3v3YJy5fhDSauNqAychPOEsSQ7emejhN5T+abmccWtGN+qNMRolyrrLtGhptx0HtQWT+0aY31J
        PmRkM/iw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q5vfi-00DFcq-1b;
        Sun, 04 Jun 2023 21:53:58 +0000
Message-ID: <e8a932aa-25ad-65a5-913b-5d940be51218@infradead.org>
Date:   Sun, 4 Jun 2023 14:53:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC] docs: process: Send patches 'To' maintainers and 'Cc' lists
To:     Bagas Sanjaya <bagasdotme@gmail.com>, James Seo <james@equiv.tech>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Kalle Valo <kvalo@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230603151447.29288-1-james@equiv.tech>
 <10e68064-42a3-c80e-10cc-079a3cf4eb35@gmail.com>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <10e68064-42a3-c80e-10cc-079a3cf4eb35@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 6/4/23 07:01, Bagas Sanjaya wrote:
> On 6/3/23 22:14, James Seo wrote:
>> To reduce ambiguity and eliminate this class of potential (albeit
>> tangential) issues, prescribe sending patches 'To' maintainers and
>> 'Cc' lists. While we're at it, strengthen the recommendation to use
>> scripts/get_maintainer.pl to find patch recipients, and move Andrew
>> Morton's callout as the maintainer of last resort to the next
>> paragraph for better flow.
>>
> 
> IMO, To: and Cc: don't have any practical differences between two,
> and I usually do vice-versa when sending patches: lists are in To:
> and individual maintainers are in Cc:

Ack all of that.

-- 
~Randy
