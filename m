Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A61312829
	for <workflows@vger.kernel.org>; Mon, 12 Jan 2026 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244536; cv=none; b=bv0aVhkP8CoOIhO2H7v6SLlItzXkf7SYoOwexs/FRsida5gmW/4dNm33ylm7kFgAPuO544iGYjvGG/slgkvIjaU+OAFbVJXsPdA4IBk9IyyXkYMozSHpQ4S2gk4+t6c30bSW9zQPK5eWt9pep3EY0kuKU43voPOTch2X9wO6xEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244536; c=relaxed/simple;
	bh=GpJ3wKU+LeNXnyIMJBhluREBdYPEkL8iKexGxHcEO2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+4yQ/9WofdZfuhKLWYEbV85ssAPSICGucglZGtwQhVntI9NU9sWGOnsuNgzxZSdKvlplWEC9dgf+exaTD3JJR5c/jqU/pSEq5hOAptFM9lXonaZCCPRlNu73gY9XRLiXpGa+g0QBPwD2PjqdAW7KHEztldqgZzFPoPlQTP42kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5JqBMrA; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5JqBMrA"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso48554325e9.1
        for <workflows@vger.kernel.org>; Mon, 12 Jan 2026 11:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768244528; x=1768849328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4pwSmM1gT+NcRUqZym3XAVxxt9CfdNJcHOpVBLrqk4o=;
        b=r5JqBMrAMj95ACq85jLQ44eMVw+dceYk/4Hn8XLqaTyZBy0OrMfQh5f8wsdeCSG/W0
         QktSFoVq4H2Mnh/Q1T5H0RCL7it6uS6WIHlUOOAoEO0e2GeiuO5WIrMuEX3o20lGOTUw
         gMfNb48lIzuwexA7Y/gqxzcHP6gjzRgyVZ6LWzqBWnbbxVEuF5feJGdfqlRcThFUcb1/
         Mgnhhf7KG6ggHTXEsGGb3rivau3gGC0U0gUabgs1H1D35JbE0CtxINsBoU7TiV6MdqPc
         MEBfC18mhtSnW/X12zc4w3nH/ioOifSpg5Wni1LXJSkkPvR+1hkLTCKNsf2fex9601KQ
         Nb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244528; x=1768849328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pwSmM1gT+NcRUqZym3XAVxxt9CfdNJcHOpVBLrqk4o=;
        b=xRi/sLxJVBsCOab+kF9UMqwBy7ZPT5x3JuA+5JMHJOKI0LHx9mV3wn6Q2ROI6B5I+C
         QzSrM65mxiT5+vXG4/Yy6MTXLAkpxA5qREa3PBs7lBtw1FxMWing5Z0msokU2ApAZjzQ
         RnfcYr8CTHts4j8mipxC+g29rFuamFOmuWo9PEj+23+hhx5uVs5Ed9+RoqC2Jv4kd3VK
         dOcCt7UrXqGQ5jKYmzl6cNT2pzzE82nrNsjxkWj8ocXvUyuhMdc4rW4z+gRPeDqqzJKI
         czUKxrcrElmVuytkTWCM4+Df9qxegqZBkoH3Utyqx4sqJw2IXI1yemCMpIV2XXZdzGCW
         1RtA==
X-Forwarded-Encrypted: i=1; AJvYcCXW59LJXOOtI3Hp+7Vn/wU65MJOisCsPHZLVWCHrCa651j8t3UUvNnD/pLAxXyZiRh3M8a9VsxB7z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdofh1KX2RNM5chaUoM3bCrBQP8BV+ONxY//nMxeyBvuxJg/P
	MNGRJjc6I/zVIiaE7pNVwLlC2s0G3NJfwJsYPsAwjuxU5fZb3FtwzfSyc3fF+e4IitU=
X-Gm-Gg: AY/fxX5Pun6MmDAplHZqOuw9AEERjIfxqCN7n+i0CoHl7WBvt7CfGDqKDYe6vqenayV
	Kzg/ivverehvP3JjvSq/EpAA92WY/NOj/nfjVtfiM3tVrctUQcTor/8L8tJBpNDmEEkVMQo9iWM
	wi+fxlWEJZjY+NmHAeh6b2Kox8WVWl0ygHcCTKwdjiITnywoa2vYU3brswJIT2QQTNNNp6873XP
	9o6L+F5yZFCUH5AvT1e9SETzbbEMCWzQtUapjHwIXDbDBfUBi2t0Ab0lsOefOh7BKFFQb/uhKEq
	YMs3pJs1TN10H9KrQ9YwHvZ2oU7JnBAEcolN5tD7KksXaX4nfFkm/N3USGI6WC0g9pAKkUIBFTQ
	3ykj2C/9SiFlUY2W22IQTPEewBEmvOgjhEICI9M10Yn8PnpttBMhApkTzSmqiI4yBDZRxJiBLhG
	75d5nDSwj1X19Lnrcl
X-Google-Smtp-Source: AGHT+IHDDtSWfiRlGnF3a09bKQUbQh6KJSFhRFbtjUj5cC3oyQnHB16AsuI/tST8xry5sUSEgb1vCg==
X-Received: by 2002:a05:600c:1d19:b0:47b:d914:98a7 with SMTP id 5b1f17b1804b1-47d84b3b65bmr221489695e9.29.1768244528451;
        Mon, 12 Jan 2026 11:02:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed8aff4aesm1894695e9.5.2026.01.12.11.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:02:07 -0800 (PST)
Date: Mon, 12 Jan 2026 22:02:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, Dave Hansen <dave.hansen@intel.com>,
	Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWVFLFdrs410YxU6@stanley.mountain>
References: <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain>
 <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
 <aWJvcPeV5ziCt5Du@mail.hallyn.com>
 <aWJ1ufun16-5EEkb@casper.infradead.org>
 <39da84e891a8ccd4a17115ce6a399c2f6498e78f.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39da84e891a8ccd4a17115ce6a399c2f6498e78f.camel@HansenPartnership.com>

On Sat, Jan 10, 2026 at 11:02:19AM -0500, James Bottomley wrote:
> On Sat, 2026-01-10 at 15:52 +0000, Matthew Wilcox wrote:
> > On Sat, Jan 10, 2026 at 09:25:36AM -0600, Serge E. Hallyn wrote:
> > > I just don't think the word "slop" should be used, because while it
> > > may be very clear to you, and may be clearly defined in some
> > > communities, me, I'm just guessing what you mean by it.
> > 
> > https://www.merriam-webster.com/wordplay/word-of-the-year
> 
> Just because it's the word of the year this year doesn't mean people
> will remember what it means even after a few years.  "Rawdog" was the
> OED word of the year in 2024 ... that's losing its resonance and who of
> the under 30 crowd knows what the 2000 word of the year "chad" means? 
> The point of the formulation I proposed (without mentioning slop) was
> to be generic and retain its meaning over time.

Slop means you produced the patches in such quantity that you don't have
time to review the output before sending it.  This isn't a totally new
thing, people have used clang-format to reformat a whole driver and it's
clear they didn't look at the output.

Even for bug reports, the truth is that no one reads mass bug reports.
I occasionally send mass bug reports if I create a new warning.  No one
ever reads them.

regards,
dan carpenter
