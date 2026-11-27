Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795816878;
	b=iVTtUHi2yh7xNjJqM4ZiiZ/gHyHTeUjbZutEtKPQABq5Kg9HepMb1/8lHtWCn/Xvomll
	 0gHCuZ68Y65PT8kzU2Ht/Q4qKLP6jaK+/tt5QvhifX9Wb8GLbI3bDGKZUZ2wJPEkEEHCN
	 PBFy5/FjS+cH56lOZA6LppEoIQhRvglExX92OSB/dKEMLuj1+7z3MqMtix9ffnr0tKOWG
	 7xby//Tl+TWc0lvIGez4A1HP7E+F0D7tsYNyFFfGLn6R/sW+8CltIeOzdJN8xSEFCE3U0
	 k/sjAUhh0Fhp5RZcGez/jDGEMg1/sW42qV0MD75Gs05f9esTg5RqRuRkBnDxUFm3DJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1vo+NyvwQIvYNQKVdVyOnd5CSTKNIDNypXUPDIcTJpw=;
	b=1CFREbA3z5GRSeFlIOdQDIbQSxwqtjIyW4l0EReZIZcSTONNSoSiVySEe+R0lFwu1kL0
	 iyjCN4ReUV0RQsFMonygns1GIjivEIaYfPN6nabiIaMUIkf1Qe86zvGAkDjbZ118Gpgfs
	 NOsqKc74E++BR0ta13zltKFMCh0pJSioyysNS/g3qsmt+OMe080Y3f7BZKrr2mI9XRRS/
	 swlq4GRLkGsRmCUrXxvwLAPCC8MBY29J7NIbnTyhHRTYTwmQv7dg5+7pCf06LUDPvSU7i
	 l7AdANSxwZ9u5SjhXTPfcv1SK0XqG3WQFc2fYraYssias346h1JdFyRJAofL2Qfrimw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LYxtQkNU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB5606A323
	for <workflows@vger.kernel.org>; Fri, 27 Nov 2026 22:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAB5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LYxtQkNU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so74805705e9.0
        for <workflows@vger.kernel.org>; Fri, 27 Nov 2026 14:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795816875; x=1796421675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vo+NyvwQIvYNQKVdVyOnd5CSTKNIDNypXUPDIcTJpw=;
        b=LYxtQkNU4gSDdTcaICQeJiEwxSOvDWLl566CKfw2vDJ0/R/xCiIMAi2buU8BXvgQfP
         f9644AhHeK3HMI+mgq7NZg4hcAulTLtYZhom0JQXEL13o2sW9rich/g6JhdrPHJds9Qf
         WCClSJZtp85Olb860ISj9Tv4i421rxSJGQQ5mJesOcrnUTPEjOACsiwlvXq1ChXtctUb
         dptte4Hx3d9yYIsSfVLfYdI/5unnVuiKwEIq/xICCIVDGMYD1sC9pxzTA5iaac9urMTC
         kq3b5cxPofQBuQJT0ogJ5CYw3ZdCCQ8PkxLQrM4Y56xxXk4zGiYg5JE1BfrPMVDbKPXW
         yJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795816875; x=1796421675;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vo+NyvwQIvYNQKVdVyOnd5CSTKNIDNypXUPDIcTJpw=;
        b=mH+/36AyQzGVlEn0EyRcuI4rmMz79wmifpKBcDj6O0rpVF6zYJwKrawVrucWM0Oq1H
         4r7QTBJljO4YeVtwFkXFGjyL9NgwX+svteaYnhdMtCAdbhPYfq6qUfabHXyxWSpE1WQS
         v2fMmJ8OVNVWDLajXtBpKhM2EawlRN5NQxn+ZBfvmsYV8UTmgwhF8R+Nk6HmDydMfJqT
         sG43k0wEdDgvlQwoDvRRXhdTafXSoKeXhYaIuZCdpZO5k2XxRTajaORoSkrzUoVJwiIn
         tGlevbYw3YUACE9z8L8NF4gvbO2m9dmfLXOY9Iq7k1Kn8sc5zfHXJ6ecwM5Xh1ty9K8s
         8vuw==
X-Forwarded-Encrypted: i=1; AL+hErHm5iusWclyc99k1RSyfgoezbWxNY8xSg0uzCjn73vL229jnLR0QFnrbvWI9llO7Ypeo6LU45sitkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95U0rTjIaUBWh71C4PkCagQSq/uAbww8S44zlfxeAzBO9tXSwP
	PM1aHvJuk6dXsai8x0sOUkj+lylx0ytL2f6XzQYDZNAWdJWz5/kTPfETUjyzSquuSac=
X-Gm-Gg: AZFdTZcQalGtAHcIFa5EfzKwZx3stMmgd6AhMVOxNJCcmfTE4M9XGNXWt5gTO8+zfcU
	jnUuFw+0ZbJOazwwvL3YPKBtc1yGJlRXsqour7UEG1Dg3qQkPihCnAzI3S3IyLq02gId0t5udzY
	cgl1JoVmDNRPf0+Mhe22OIP1KxwHSPmgHUynIKwas3tCIQkvTs0AENF1m91hajFv4jxoN64nrH0
	86lESOHaTlixCIPcGhLNWa1LMN/fqaIwojmrqykyWeB0klNFvEsf3qhmWfuQx2mnpIcnZtATzrl
	4vztg5xBbGFT8DxsinxNnYASRUhjnvSdTD73HQOVNvdeUC+VEj1tAfM8qXybKNLoTyDfH74k5Xe
	+ZKghuNNcbD2o79AuZS47F7LXdmGTKDqu9PJyaCTYx6jxVINqXfU2pyvubM8kq2xZFQ3/U9VxCs
	i2haHS8w0twmI5U7N+jPf9j+hzV8x7CFXqAXfLwzfVli0Fuan1907KZHTCS/vf0nyuhRNFr8P/2
	kaUuEdCkq2+KtU5045yexqscGt+x5PODA3DirCZptXWtyFU3RObLpaOxQebsr0e31olITqN8xZF
	2PnGH7JBxirOjjKzXViiAw==
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr644873285e9.23.1795816875412;
        Fri, 27 Nov 2026 14:01:15 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm67195403eec.8.2026.11.27.14.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 14:01:14 -0800 (PST)
Message-ID: <138ba3eb-7225-429b-9791-2de9d49e1fdf@suse.com>
Date: Sat, 28 Nov 2026 08:31:09 +1030
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: add a maintainer entry profile
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-btrfs@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <0037554862c0d9dce3ddafd1238347e4b16a5079.1795581896.git.wqu@suse.com>
 <20261126133712.GN774860@unreal>
 <978c5ae0-8cf2-47d4-8fb5-1d96896132be@suse.com>
 <20261127151418.GY774860@unreal>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261127151418.GY774860@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/28 01:44, Leon Romanovsky 写道:
> On Fri, Nov 27, 2026 at 08:23:13PM +1030, Qu Wenruo wrote:
>>
>>
>> 在 2026/11/27 00:07, Leon Romanovsky 写道:
>>> On Wed, Nov 25, 2026 at 03:16:21PM +1030, Qu Wenruo wrote:
>>>> This new file is mostly based on my personal preferences, focusing on
>>>> how to improve the human readability in the LLM era.
>>>>
>>>> The new file should also act as a guide for humans that want to be a
>>>> long term contributor to btrfs.
>>>
>>> My previous comment still applies. Most of it is relevant to other
>>> subsystems as well, and some of the suggestions duplicate existing
>>> documentation.
>>
>> One question is, I can't find a generic one, nor there is a generic entry
>> inside the MAINTAINERS file.
>>
>> If we're going to create a generic one, shouldn't we just update the
>> existing docs like `Documentation/process/submitting-patches.rst` instead?
> 
> See Documentation/process/coding-assistants.rst file.
> For example, this series from Sasha changes it
> https://lore.kernel.org/workflows/20261126171926.2766137-1-sashal@kernel.org/

I think this is against Krzysztof's comment:


 > Then it should be a maintainer profile. We should write docs for humans,
 > which can be used by agents. Not the other way around.

I agree with that comment.

But putting that into code-assistants.rst means it's only for LLMs, not 
humans.


> 
>>
>> And to be honest, the current one is already a little LLM orient, lengthy
>> and not well human reader friendly.
> 
> I disagree that file was written before AI era and everyone who
> submitted patches or read it was asked to read after first mistake.
> 
>>
>>
>> So what's the recommended next step?
> 
> Read the documentation :) and more seriously, update Documentation/process/coding-assistants.rst.
> 
> Thanks
> 
>>
>> Thanks,
>> Qu
>>
>>>
>>>>
>>>> Signed-off-by: Qu Wenruo <wqu@suse.com>
>>>> ---
>>>> Changelog:
>>>> RFC->v1:
>>>> - Use maintainer entry profile instead of agent.md
>>>>
>>>> - Further simplfy the content for human readers
>>>>
>>>> ---
>>>>    Documentation/process/maintainer-btrfs.rst | 154 +++++++++++++++++++++
>>>>    MAINTAINERS                                |   2 +
>>>>    2 files changed, 156 insertions(+)
>>>>    create mode 100644 Documentation/process/maintainer-btrfs.rst
>>>>
>>>> diff --git a/Documentation/process/maintainer-btrfs.rst b/Documentation/process/maintainer-btrfs.rst
>>>> new file mode 100644
>>>> index 000000000000..5170dd73e655
>>>> --- /dev/null
>>>> +++ b/Documentation/process/maintainer-btrfs.rst
>>>> @@ -0,0 +1,154 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +Btrfs patch guidelines
>>>> +======================
>>>> +
>>>> +Human readability comes first. A reviewer should be able to understand the
>>>> +problem and the fix from the message and code.
>>>> +
>>>> +Bloated LLM-generated information only wastes precious human time, no matter
>>>> +whether it is in a comment or a commit message.
>>>
>>> This is general.
>>>
>>>> +
>>>> +Code comments
>>>> +-------------
>>>> +
>>>> +* **Necessary comment only**
>>>> +
>>>> +  Comment is for things that are not obvious by itself, e.g. a locking
>>>> +  rule, an ordering requirement or a non-trivial reason for a workaround.
>>>> +
>>>> +  Keep the comment short if possible.
>>>> +
>>>> +  Don't repeat what the code does.
>>>
>>> General too.
>>>
>>>> +
>>>> +* **Add kernel-doc only for complex and/or exported functions**
>>>> +
>>>> +  If the function and parameter names are self-explaining, don't waste words
>>>> +  on the kernel-doc.
>>>
>>> This is applicable to many subsystems, but probably not general.
>>>
>>>> +
>>>> +Commit messages and cover letters
>>>> +---------------------------------
>>>> +
>>>> +* **Keep it simple**
>>>> +
>>>> +  Use short and simple sentences, avoid long paragraphs.
>>>> +
>>>> +  Simple patch for simple bug. Don't write a full [BUG] [CAUSE] [FIX] analysis
>>>> +  for something like a simple error handling enhancement.
>>>> +
>>>> +  And we don't care how you or your LLM found the bug unless it's hit in the
>>>> +  real world, so don't put such information even after the "---" line.
>>>
>>> General
>>>
>>>> +
>>>> +* **Prefer visual aids over long sentences**
>>>> +
>>>> +  See "Visual aids" section below.
>>>
>>> General
>>>
>>>> +
>>>> +* **Follow the style of well-known btrfs developers**
>>>> +
>>>> +  Check ``git log -- fs/btrfs`` for recent examples before drafting.
>>>
>>> General
>>>
>>>> +
>>>> +Visual aids
>>>> +-----------
>>>> +
>>>> +Prefer visual aids like an ASCII chart over words, e.g.:
>>>> +
>>>> +* A race. Show the race window, do not describe it in prose only.
>>>> +* An error handling bug in a function, seen from several call sites.
>>>> +* A call chain across layers, where the bug only shows on a certain path.
>>>> +
>>>> +Example, a race::
>>>> +
>>>> +   CPU0 (endio)                       CPU1 (fsync)
>>>> +   end_bbio_data_write()
>>>> +   |-btrfs_folio_clear_writeback()
>>>> +   |                                  btrfs_sync_file()
>>>> +   |                                  |-filemap_fdatawait_range()
>>>> +   |                                  | Returns after writeback finished
>>>> +   |                                  |
>>>> +   |                                  \-test_and_clear_bit(COW_WRITE_ERROR)
>>>> +   |                                    Still 0, skips waiting
>>>> +   \-set_bit(COW_WRITE_ERROR)
>>>> +     Too late.
>>>> +
>>>> +Example, an error handling bug, from commit c9583ada8cc4. The callee cleans up
>>>> +on error, then the caller cleans up again::
>>>> +
>>>> +   btrfs_do_readpage()
>>>> +   |-submit_extent_page()
>>>> +   | \-submit_one_bio()
>>>> +   |   \-btrfs_submit_data_bio()
>>>> +   |     \-bio_endio()
>>>> +   |       Calls end_page_read() and unlock_extent().
>>>> +   |
>>>> +   \-end_page_read() and unlock_extent()
>>>> +     Cleaned up again, the subpage reader count underflows.
>>>
>>> General
>>>
>>>> +
>>>> +Versioned patches
>>>> +-----------------
>>>> +
>>>> +* **Full history**
>>>> +
>>>> +  Include all versions, not only the changes of the last version.
>>>
>>> General
>>>
>>>> +
>>>> +* **Newest version first**
>>>> +
>>>> +  E.g.::
>>>> +
>>>> +    v3:
>>>> +    - Rename the helper to xxx()
>>>> +    - Add a missing lock in yyy()
>>>> +
>>>> +    v2:
>>>> +    - Fix the build failure on 32-bit
>>>> +
>>>> +* **Changelog location**
>>>> +
>>>> +  Put it in the cover letter for a patch series, or after the "---" line for
>>>> +  a single patch.
>>>> +
>>>> +  Don't put it in the commit message body.
>>>
>>> General
>>>
>>>> +
>>>> +Review
>>>> +------
>>>> +
>>>> +* **Follow the review**
>>>> +
>>>> +  Don't send a patch and just forget it. If you're not a well known developer,
>>>> +  it's uncommon to get merged on the first try.
>>>> +
>>>> +  One will need to communicate with the reviewers to get at least one review
>>>> +  from a well known btrfs developer, before getting the patch merged.
>>>> +
>>>> +* **Check Sashiko**
>>>> +
>>>> +  Sashiko posts AI-generated review for patches sent to the mailing list. The
>>>> +  btrfs list is at https://sashiko.dev/#/?list=org.kernel.vger.linux-btrfs
>>>> +
>>>> +  If a report is valid, address it in a newer version.
>>>> +
>>>> +  If a report is obviously wrong, it can be ignored. If the report is wrong but
>>>> +  the reason is not obvious, explaining it on the mailing list can help.
>>>> +
>>>> +Testing
>>>> +-------
>>>> +
>>>> +* **Run full fstests**
>>>> +
>>>> +  That's the main test suite we use.
>>>> +
>>>> +* **Testing procedures and results are only for complex patches**
>>>> +
>>>> +  Simple fixes shouldn't need a long paragraph on how to verify the fix.
>>>> +  Those simple fixes should be explained well by the commit message and code.
>>>> +
>>>> +  Bloated LLM-generated test procedures and results only waste human time.
>>>> +
>>>> +Before sending a patch
>>>> +----------------------
>>>> +
>>>> +* **Check the development branch**
>>>> +
>>>> +* **Check the mailing list**
>>>> +
>>>> +If your bug was found by an LLM, someone else may have already found, or even
>>>> +fixed, it.
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 44540a1eb2b8..55f0b3dca133 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -5838,9 +5838,11 @@ S:	Maintained
>>>>    W:	https://btrfs.readthedocs.io
>>>>    Q:	https://patchwork.kernel.org/project/linux-btrfs/list/
>>>>    C:	irc://irc.libera.chat/btrfs
>>>> +P:	Documentation/process/maintainer-btrfs.rst
>>>>    T:	git https://github.com/btrfs/linux.git for-next
>>>>    T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
>>>>    F:	Documentation/filesystems/btrfs.rst
>>>> +F:	Documentation/process/maintainer-btrfs.rst
>>>>    F:	fs/btrfs/
>>>>    F:	include/linux/btrfs*
>>>>    F:	include/trace/events/btrfs.h
>>>> -- 
>>>> 2.56.1
>>>>
>>>>
>>
>>

