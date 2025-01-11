Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C324B259;
	Sat, 11 Jan 2025 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736586212; cv=none; b=VsRKwSufY6RBChxlbCxufNFs4f9mfrweqd7QXhv3M8ctkiO2Qit20JiWz8Rq/AuW2868Ny95Y6Lxj17mHUiRb3wILRBS6QBT0mS2Y18mbd7r1lt+gOQNW1VlyfedLjtntaRgFu+eAoXIqhfXgMcnMQMbQeuUl/aXIrCEiMfaOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736586212; c=relaxed/simple;
	bh=fe8hQbhSrHnKQLa6hQ32uMJjjGqU82F+/eHC/K7EVqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubFn2ucJ9UYduaFErXpxKBRhmULCM9XwP28GBT7WxvmpiXbNmQSE70D0ndzccO5WrPDcK4BOWt9SjR93mR8Al8vFpwcWITlWh6yRvLS8cG4dAovrRU+z8l0SdFQYlP4vlxgfWoAc+91aYAAoCuurdkk4JPhvlecybjUT4hWO+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzD2q+fB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzD2q+fB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736586210; x=1768122210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fe8hQbhSrHnKQLa6hQ32uMJjjGqU82F+/eHC/K7EVqY=;
  b=DzD2q+fBZBSZnyOpsPSr2BTQO9fNXHgxGDmOPbVJheITcvC4uHdpDgSY
   PIzAJRZjM1u2Oqe5unjVNBydtAnhNb2Xg5nqCJnLKrH5ZJ9ivXbk+XDPp
   Ra6LcQff3RkilivQV5Ys7LKDiE8tpKI4b5mV/7h3G00LmpLK4+fFKrmdF
   8MDqwSQIRbHZ1MOlAF7kjqAlUjfJCZIFJSz/H9sE/cC1cl57Nf/2B+iME
   qprL0oYeQ3zkE1ErV5ohukw+Zef1JDtkgucSt4YXYGbgFGeQx6QULuMkf
   qe63uAqRj8efRrUHeQ5jbwfoiztDx3KLbTaEma0S0QWis0wwXyUS6j9Vy
   A==;
X-CSE-ConnectionGUID: ETAM9WgNStq0KGJtN1ohEg==
X-CSE-MsgGUID: uZ7oBHfzT3y7ukW4hewtxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47539402"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="47539402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:03:29 -0800
X-CSE-ConnectionGUID: oCQrinvrTZCo4PAjo8jItw==
X-CSE-MsgGUID: wYkb33BGSESFvAVOOYwQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104829956"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jan 2025 01:03:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXOo-000KPn-2r;
	Sat, 11 Jan 2025 09:03:18 +0000
Date: Sat, 11 Jan 2025 17:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Jiao <quic_jiangenj@quicinc.com>, dvyukov@google.com,
	andreyknvl@gmail.com, corbet@lwn.net, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, nogikh@google.com, elver@google.com,
	pierre.gondois@arm.com, cmllamas@google.com,
	quic_zijuhu@quicinc.com, richard.weiyang@gmail.com,
	tglx@linutronix.de, arnd@arndb.de, catalin.marinas@arm.com,
	will@kernel.org, dennis@kernel.org, tj@kernel.org, cl@linux.com,
	ruanjinjie@huawei.com, colyli@suse.de,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, kernel@quicinc.com,
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
Message-ID: <202501111600.ojBvC1LF-lkp@intel.com>
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Jiao/kcov-add-unique-cover-edge-and-cmp-modes/20250110-153559
base:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
patch link:    https://lore.kernel.org/r/20250110073056.2594638-1-quic_jiangenj%40quicinc.com
patch subject: [PATCH] kcov: add unique cover, edge, and cmp modes
config: arm-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111600.ojBvC1LF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111600.ojBvC1LF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111600.ojBvC1LF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kcov.c: In function 'kcov_map_add':
>> kernel/kcov.c:309:60: error: 'struct kcov_entry' has no member named 'type'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                            ^~
   kernel/kcov.c:309:73: error: 'struct kcov_entry' has no member named 'type'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                                         ^~
>> kernel/kcov.c:310:34: error: 'struct kcov_entry' has no member named 'arg1'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                  ^~
   kernel/kcov.c:310:47: error: 'struct kcov_entry' has no member named 'arg1'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                               ^~
>> kernel/kcov.c:310:62: error: 'struct kcov_entry' has no member named 'arg2'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                              ^~
   kernel/kcov.c:310:75: error: 'struct kcov_entry' has no member named 'arg2'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                                           ^~
   kernel/kcov.c:343:48: error: 'struct kcov_entry' has no member named 'type'
     343 |                         area[start_index] = ent->type;
         |                                                ^~
   kernel/kcov.c:344:52: error: 'struct kcov_entry' has no member named 'arg1'
     344 |                         area[start_index + 1] = ent->arg1;
         |                                                    ^~
   kernel/kcov.c:345:52: error: 'struct kcov_entry' has no member named 'arg2'
     345 |                         area[start_index + 2] = ent->arg2;
         |                                                    ^~


vim +309 kernel/kcov.c

   290	
   291	static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry *ent,
   292						struct task_struct *t, unsigned int mode)
   293	{
   294		struct kcov *kcov;
   295		struct kcov_entry *entry;
   296		unsigned int key = hash_key(ent);
   297		unsigned long pos, start_index, end_pos, max_pos, *area;
   298	
   299		kcov = t->kcov;
   300	
   301		if ((mode == KCOV_MODE_TRACE_UNIQ_PC ||
   302		     mode == KCOV_MODE_TRACE_UNIQ_EDGE))
   303			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
   304				if (entry->ent == ent->ent)
   305					return;
   306			}
   307		else
   308			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
 > 309				if (entry->ent == ent->ent && entry->type == ent->type &&
 > 310				    entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
   311					return;
   312				}
   313			}
   314	
   315		entry = (struct kcov_entry *)gen_pool_alloc(map->pool, 1 << MIN_POOL_ALLOC_ORDER);
   316		if (unlikely(!entry))
   317			return;
   318	
   319		barrier();
   320		memcpy(entry, ent, sizeof(*entry));
   321		hash_add_rcu(map->buckets, &entry->node, key);
   322	
   323		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_CMP)
   324			area = t->kcov_area;
   325		else
   326			area = kcov->map_edge->area;
   327	
   328		pos = READ_ONCE(area[0]) + 1;
   329		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_EDGE) {
   330			if (likely(pos < t->kcov_size)) {
   331				WRITE_ONCE(area[0], pos);
   332				barrier();
   333				area[pos] = ent->ent;
   334			}
   335		} else {
   336			start_index = 1 + (pos - 1) * KCOV_WORDS_PER_CMP;
   337			max_pos = t->kcov_size * sizeof(unsigned long);
   338			end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
   339			if (likely(end_pos <= max_pos)) {
   340				/* See comment in __sanitizer_cov_trace_pc(). */
   341				WRITE_ONCE(area[0], pos);
   342				barrier();
   343				area[start_index] = ent->type;
   344				area[start_index + 1] = ent->arg1;
   345				area[start_index + 2] = ent->arg2;
   346				area[start_index + 3] = ent->ent;
   347			}
   348		}
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
