Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F4A3CBE96
	for <workflows@vger.kernel.org>; Thu,  9 Jul 2026 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584979; cv=none; b=R9ENDov6+9iY912sHmWbgdPWQPBLwBW2Tmq5u902gh6ImMpfFoBeDNUN+zuj/Sr1HrEvqYKT3Fpcbbt55ROoGXhb4AoYpGhvLblY8cw0HY4tJtX6wLmgcLxlppBJ5BKyr3OPR9EQTS7yvf0mUsjZFQXk9Uqw9h0Hp8rUXENYPIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584979; c=relaxed/simple;
	bh=vMvzVDyhwRVZ9mU/uGek2iqLm5M9Oc3aOzpsUrM1kxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBneuLA8DOwefoUOmM1dHS2a1ZsZYUs30Tc6Uo1HU4R19dHfv7ww02jHNu2b/OsM9UAL3zOx5kSrZpelYEr1R16UsN7JwqsuP45Rn6TWXhAUsqGr5PPzF/F7UvDWeKun1CJXDm5VtnReo+fNNp8TffL+Vw23KIdKJ4kCOme2++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BvFrVRoe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BvFrVRoe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b77b150aso12226495e9.2
        for <workflows@vger.kernel.org>; Thu, 09 Jul 2026 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783584976; x=1784189776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+CFlNGgVOBUKoyPjKhrOhvumBe76lgJlilpAZoLH+g=;
        b=BvFrVRoeLdX9K67kasMhrWS3/kUZ3sUPj+VTdiYOPJrmUJ2OVcYURmwa5PSTGOl80p
         EKMqIJlyhLMJIDKcjk/Uupo22TEgpkVnjJ3miA+2E6zuDJECj4soGqwzKsL0HzzQUH4c
         kmSzGWLSqlgnxW9Kig//yvcbRE58E7qwLWaM70bo6Y8pu6+BQMQtY6J1ytMSDWQIHRYk
         BhSVn9FzF8ZLqhxyoL+F20K+CvCwkYwbkpIRWa3zP6tf04lYKxrWcOk0koGiilHLjWyh
         0/xUZkcbeb1xgpVL7F6EvzAeQHxKAf+g5kby0g8tvIK6H0+8v+A32sHsdg2XmTJ6iuSL
         jnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584976; x=1784189776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+CFlNGgVOBUKoyPjKhrOhvumBe76lgJlilpAZoLH+g=;
        b=g/bwVZTBeIdPVTKd5qZSRsahkNLbmxubWdtOGCDmQrD4dDejlGCKSL2xvK22EWl4pn
         i/RDJCtmIlT5O4oQiWDAi6j2hf+vBGLdafFXRvKpEAn6vGSVaN0dT9WYLkwBHWkTsl5u
         HKi1i/3UMrimXuq8QP83N6eSO+2qdw5cOFnjhVl0429mGXTbOJz/8KD0b6M75bz6JucO
         dXZs0TvyCpq/tw0PmTlURaRymHzDnWn6Tek3LPcbqRH1XAyGrmtYHfoe9cKvsZVZX15/
         cEy1e8/naBI0VhOcGMqIjR//Tp4oLXdmRSrM8eVHbM8/xTR5VMtx0UHIxoYBgyD7LQyV
         H0OA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1Mns7dcWvUZvJEUCi478vfIic5sfFH6AZwTBLUcPA/+VszIGgZgHdBwrOlJkHjrT7MjGc0DAX/DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvcI+K6DWhfbFDXAyyxp+p249ft5QJV/fwfAe6utkl6ASIePja
	PxPSqpZhCvaSJ9FpKsr+cgumGeVXW1MBXOA2f6d9ijG2w7DMBn9EGl1VBoSDmgV8GWc=
X-Gm-Gg: AfdE7cnNUXcE0jCmVEb1cSDKffrQNoGFo9V7Gn9uz351dp2anKquawm5dYyPweMPNQ6
	/06dclpOnegNbpprxuaXrEkn6AHH7g8P5rqDTyNBb6wRALj5gGU/qbefh9X8zSOk3R8jxcffqAR
	eZOPc4xL7XGsyz5rWvT17Ykya7xznUKCVVJjTmKzBjXqe3in5OywPXwTCoMBQrfbLiNsjXwyNOD
	O9mn8O6dTrDvxmrArB62KHCDVZhVOzR8icvyyDIocUa3RJlZsw3KXKDIsOBHyaleUnQOA1haNct
	N2bmST0cDWZSI4j43pYehW/0bR3oClA7zaIkcwIHAk5BXSzsvclH7MnePBruq7+6ch6j/2R8Bka
	TBwLqM3l+FRhDql5wByc38JYJRdGoxv+SfxIddr5TtEji/H1Q2GVHN5dCQgCdfF3EDF4kf8OwrL
	B7Bwm2kmUMGjCUTmk=
X-Received: by 2002:a05:600c:1d1e:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493e68bf03amr56205565e9.23.1783584976164;
        Thu, 09 Jul 2026 01:16:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ee2bcac0sm20177645e9.0.2026.07.09.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:16:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:16:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 21/26] printk: Register information into meminspect
Message-ID: <ak9YzK_Puejpg_du@pathway.suse.cz>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4Cr5GEMdo8xWqu@lucifer>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4Cr5GEMdo8xWqu@lucifer>

On Wed 2026-07-08 08:59:26, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 11:02:00AM +0530, Mukesh Ojha wrote:
> > Annotate vital static, dynamic information into meminspect for debugging
> >
> > Static:
> >  - prb_descs
> >  - prb_infos
> >  - prb
> >  - prb_data
> >  - clear_seq
> >  - printk_rb_static
> >  - printk_rb_dynamic
> >
> > Dynamic:
> >  - new_descs
> >  - new_infos
> >  - new_log_buf
> >
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -49,6 +49,7 @@
> >  #include <linux/sched/debug.h>
> >  #include <linux/sched/task_stack.h>
> >  #include <linux/panic.h>
> > +#include <linux/meminspect.h>
> >
> >  #include <linux/uaccess.h>
> >  #include <asm/sections.h>
> > @@ -518,10 +519,17 @@ static u32 log_buf_len = __LOG_BUF_LEN;
> >  #endif
> >  _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
> >  		 PRB_AVGBITS, &__log_buf[0]);
> > +MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
> > +MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
> > +MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
> > +MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
> >
> >  static struct printk_ringbuffer printk_rb_dynamic;
> > +MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
> >
> >  struct printk_ringbuffer *prb = &printk_rb_static;
> > +MEMINSPECT_SIMPLE_ENTRY(prb);
> > +MEMINSPECT_SIMPLE_ENTRY(clear_seq);
> >
> >  /*
> >   * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
> > @@ -1238,6 +1246,10 @@ void __init setup_log_buf(int early)
> >
> >  	local_irq_restore(flags);
> >
> > +	meminspect_lock_register_va(new_log_buf, new_log_buf_len);
> > +	meminspect_lock_register_va(new_descs, new_descs_size);
> > +	meminspect_lock_register_va(new_infos, new_infos_size);
> > +
> >  	/*
> >  	 * Copy any remaining messages that might have appeared from
> >  	 * NMI context after copying but before switching to the
> 
> Overall exposing live dynamic printk information to drivers seems unwise, but
> not quite as insane as some of the other stuff thus exposed...

I agree that we should be careful with exporting symbols.

Well, if I get it correctly then at least the printk-related symbols
are already exported a similar way using vmcore_info.h API,
see log_buf_vmcoreinfo_setup().

Best Regards,
Petr
