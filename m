Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A060C83F11
	for <workflows@archiver.kernel.org>; Mon, 28 Aug 2023 19:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbjH1TSO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 28 Aug 2023 15:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbjH1TSF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 28 Aug 2023 15:18:05 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D92510E;
        Mon, 28 Aug 2023 12:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=5zFVdPtfztwn5d5o/jBamqnUfVVF6laYfq1H+nqTLss=; b=E/6SNmHiyzHfN9LySGhIyKiyLZ
        JOwlfWOseE55e+7sh34NZv7y2OmlKBceHppjtmTZUUFk5inmLlTOZ5fp2gMx13R+QNNUuD7O1QwGy
        iBzs9FMXWl5F6BVPfOmCAhaZS+M2ugL8lTIHKgftS2fK4L0tyuNc6UYefpbW5ykjxPhGUCsktI6EI
        Sfcc/eEEAOW+qNALoQgr3a2AXqPzEYQK/a9RjPmv3eGKQCw2KC0m9BuKvYuG8HiqghF00SWd+U/ZD
        Ql1FGlgg0FQvt5bFsBYzlI4AMo6ZvOXUpdkgpoY+pwwYck3r3o6v/xfx2ovRVOGLGTK+8xrDj/o6V
        88rtDXKw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qahkN-00A8Lh-0d;
        Mon, 28 Aug 2023 19:17:59 +0000
Message-ID: <ec4f5b6e-0d9a-f4d9-bec2-12a044643b35@infradead.org>
Date:   Mon, 28 Aug 2023 12:17:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next] docs: netdev: document patchwork patch states
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230828184447.2142383-1-kuba@kernel.org>
 <5b7d9eff-cc95-fe37-6762-ef08e153213c@infradead.org>
 <20230828121700.4a319a1e@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230828121700.4a319a1e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 8/28/23 12:17, Jakub Kicinski wrote:
> On Mon, 28 Aug 2023 12:05:45 -0700 Randy Dunlap wrote:
>>>  The "State" field will tell you exactly where things are at with your
>>> -patch. Patches are indexed by the ``Message-ID`` header of the emails
>>> +patch:  
>>
>>                                                       of the patch's email.
> 
> The diff may be a little confusing. The full sentence is below..
> 


Ah yes, my bad. Thanks.

>>> +================== =============================================================
>>> +Patch state        Description
>>> +================== =============================================================
>>> +New, Under review  pending review, patch is in the maintainer’s queue for review
>>> +Accepted           patch was applied to the appropriate networking tree, this is
>>> +                   usually set automatically by the pw-bot
>>> +Needs ACK          waiting for an ack from an area maintainer or testing
>>> +Changes requested  patch has not passed the review, new revision is expected
>>> +                   with appropriate code and commit message changes
>>> +Rejected           patch has been rejected and new revision is not expected
>>> +Not applicable     patch is expected to be applied outside of the networking
>>> +                   subsystem
>>> +Awaiting upstream  patch should be reviewed and handled by appropriate
>>> +                   sub-maintainer, who will send it on to the networking trees
>>> +Deferred           patch needs to be reposted later, usually due to dependency
>>> +                   or because it was posted for a closed tree
>>> +Superseded         new version of the patch was posted, usually set by the
>>> +                   pw-bot
>>> +RFC                not to be applied, usually not in maintainer’s review queue,
>>> +                   pw-bot can automatically set patches to this state based
>>> +		   on subject tags  
>>
>> Nit:
>> Above line uses tabs for indentation. All other lines here use spaces.
> 
> Thanks, will fix.
> 
>>> +================== =============================================================
>>> +
>>> +Patches are indexed by the ``Message-ID`` header of the emails
>>>  which carried them so if you have trouble finding your patch append
> 
> ..here.

-- 
~Randy
