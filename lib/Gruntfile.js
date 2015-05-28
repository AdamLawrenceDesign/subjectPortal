module.exports = function(grunt) {

	
    grunt.initConfig(
	{
		pkg: '<json:package.json>',
		
		concat: {
			js : {
				src : [
					'src/js/jquery.cycle2.min.js',
					'src/js/server-query.js',
					'src/js/build-links.js',
					'src/js/page-style.js',
					'src/js/to-top.js',
					'src/js/watermark.js',
					'src/js/menu-ctrls.js'
				],
				dest : 'prod/project.js'
			}
		},

		uglify: {
			js : {
				src : [
					'prod/project.js'
				],
				dest : 'prod/project.min.js'
			},
		},
		
		sass: {
			dist: {
				options: {
					style: 'expanded'
				},
				files: {
					'prod/screen.css':'src/sass/screen.scss'
				}
			}
		},
		
		watch: {

			// Run Normally 
		  	files: ['src/js/*','src/sass/*'],			// , 'src/css/*'	
		  	tasks: ['concat:js', 'uglify:js','sass']	// , 'concat:css', 'cssmin:css'

		  	// No CSS Uglify
		  	// files: ['src/js/*'],			// , 'src/css/*'		
		  	// tasks: ['concat:js']	// , 'concat:css', 'cssmin:css'
			
			// Quick CSS
			/*
			files: ['src/sass/*'],						// , 'src/css/*'		
			tasks: ['sass']								// , 'concat:css', 'cssmin:css'
			*/
		}	
			
    });
	
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-sass')
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch:files']);
	
};	